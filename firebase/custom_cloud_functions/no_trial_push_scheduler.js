const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

// ── NO-TRIAL / FULL UNLOCK FLOW ─────────────────────────────────────────────
// For users who registered (created_time >= cutoff) but never started a trial
// and never bought anything. Timeline from registration:
//   Push 1  — 24h        → SeasonWorkoutPage
//   Push 2  — day 4 (96h) → SeasonWorkoutPage
//   Push 3  — day 7 (168h) → GRANTS Full Unlock for 72h + push
//   Push 4  — 48h of unlock left → SeasonWorkoutPage
//   Push 5  — 24h of unlock left → SeasonWorkoutPage
//   Push 6  — unlock ended → revoke + SubscriptionPage
//
// Manual access ("Full Unlock") = a gifted trial. It reuses the trial fields:
//   subscription_status = 'manual'         (active) / 'manualExpired' (ended)
//   trial_started_at / trial_ends_at       = the 72h window
//   plusmember = true                      = the only content gate (unchanged)
//   full_unlock_used = true                = granted once, never again
// It does NOT touch lifetime/expired_at (those belong to the admin lifetime
// sub) and never overrides lifetime or a real RevenueCat purchase — a real
// trial/subscription (subscription_status trial/active, written by
// checkSubsStatus) takes over and the flow stops.
//
// Grant/revoke are TIME-driven (happen even without an FCM token); the pushes
// are only sent when a token exists, and when several are overdue at once only
// the LATEST is sent (the earlier ones are marked as sent / suppressed).

// ── TEST MODE ──────────────────────────────────────────────────────────────
// true  → compressed: pushes at 1h/2h, unlock at 3h for 3h, reminders ≤2h/≤1h.
// false → production: 24h/96h/168h, unlock 72h, reminders ≤48h/≤24h remaining.
const TEST_MODE = true;

const H = TEST_MODE
  ? { push1: 1, push2: 2, unlockAt: 3, unlockDuration: 3, remindA: 2, remindB: 1 }
  : { push1: 24, push2: 96, unlockAt: 168, unlockDuration: 72, remindA: 48, remindB: 24 };

// Delivery via the FlutterFlow trigger on ff_push_notifications.
const kUserPushCollection = "ff_push_notifications";

// Only users registered on/after this date enter the flow.
const kCutoffDate = new Date("2026-06-01T00:00:00Z");
const kCutoffMs = kCutoffDate.getTime();

// Flow lasts ~10 days from registration; look back a bit further as margin.
const kWindowDays = 13;

const P = {
  push1: {
    flag: "no_trial_24h_push_sent",
    title: "One session. That's all it takes. 🔥",
    body: "Pick your level and feel what it's like to train everything at once.",
    page: "SeasonWorkoutPage",
  },
  push2: {
    flag: "no_trial_96h_push_sent",
    title: "Still thinking about it?",
    body: "The music. The moves. The energy. That's why people stay.",
    page: "SeasonWorkoutPage",
  },
  push3: {
    flag: "full_unlock_start_push_sent",
    title: "🔓 Full Access — 72 hours only",
    body: "All workouts. All levels. All music. No payment needed. Starts NOW.",
    page: "SeasonWorkoutPage",
  },
  push4: {
    flag: "full_unlock_48h_push_sent",
    title: "⏳ 48 hours left of full access",
    body: "Tried a workout yet? Unlock a whole new way to move.",
    page: "SeasonWorkoutPage",
  },
  push5: {
    flag: "full_unlock_24h_push_sent",
    title: "⏳ 24 hours left. Tomorrow it's gone.",
    body: "This is your last chance to feel it.",
    page: "SeasonWorkoutPage",
  },
  push6: {
    flag: "full_unlock_end_push_sent",
    title: "Your full access has ended.",
    body: "Keep training. Choose your plan and pick up where you left off.",
    page: "SubscriptionPage",
  },
};

// Normalize Firestore Timestamp / Date / ISO string / millis to epoch millis.
function toMillis(value) {
  if (value == null) return null;
  if (typeof value.toMillis === "function") return value.toMillis();
  if (value instanceof Date) return value.getTime();
  if (typeof value === "number") return value;
  const parsed = Date.parse(value);
  return Number.isNaN(parsed) ? null : parsed;
}

// A token in the fcm_tokens subcollection means the user granted permission.
async function userHasFcmToken(userRef) {
  const tokens = await userRef.collection("fcm_tokens").limit(1).get();
  return !tokens.empty;
}

// Same doc shape the working ff_push_notifications trigger consumes.
async function queuePush(db, userRef, push) {
  await db.collection(kUserPushCollection).add({
    notification_title: push.title,
    notification_text: push.body,
    notification_sound: "default",
    initial_page_name: push.page,
    parameter_data: "{}",
    user_refs: userRef.path,
    sender: userRef.path,
    target_audience: "All",
    scheduled_time: "",
    status: "started",
    timestamp: admin.firestore.FieldValue.serverTimestamp(),
  });
}

exports.noTrialPushScheduler = functions
  .runWith({
    timeoutSeconds: 540,
    memory: "512MB",
  })
  .pubsub.schedule("0 * * * *") // hourly
  .timeZone("UTC")
  .onRun(async (context) => {
    const db = admin.firestore();
    const nowMs = Date.now();
    const hourMs = 60 * 60 * 1000;

    const windowStartMs = Math.max(kCutoffMs, nowMs - kWindowDays * 24 * hourMs);
    const users = await db
      .collection("users")
      .where("created_time", ">=", new Date(windowStartMs))
      .get();

    if (users.empty) {
      console.log("noTrialPushScheduler: no users in window");
      return null;
    }

    let sentCount = 0;
    let grantedCount = 0;
    let revokedCount = 0;

    for (const doc of users.docs) {
      try {
        const data = doc.data();
        const userRef = doc.ref;

        // Real lifetime / admin-granted access — never touch.
        if (data.lifetime === true) continue;

        // Real RevenueCat trial or subscription (written by checkSubsStatus) —
        // the real purchase wins, this flow is over for them.
        const status = data.subscription_status || "";
        if (status === "trial" || status === "active") continue;

        // Ever had a real paid subscription — skip.
        if (toMillis(data.subscription_started_at) !== null) continue;

        const createdMs = toMillis(data.created_time);
        if (createdMs === null) continue;

        const fullUnlockUsed = data.full_unlock_used === true;
        const trialEndsMs = toMillis(data.trial_ends_at);

        // ══ PHASE B/C: Full Unlock already granted ══
        if (fullUnlockUsed) {
          // Unlock window still open → start/reminder pushes by time remaining.
          if (status === "manual" && trialEndsMs !== null && nowMs < trialEndsMs) {
            const remainingHours = (trialEndsMs - nowMs) / hourMs;
            let push = null;
            const flagUpdates = {};

            if (remainingHours <= H.remindB && data[P.push5.flag] !== true) {
              push = P.push5;
              flagUpdates[P.push3.flag] = true; // suppress earlier ones
              flagUpdates[P.push4.flag] = true;
              flagUpdates[P.push5.flag] = true;
            } else if (
              remainingHours <= H.remindA &&
              data[P.push4.flag] !== true
            ) {
              push = P.push4;
              flagUpdates[P.push3.flag] = true;
              flagUpdates[P.push4.flag] = true;
            } else if (data[P.push3.flag] !== true) {
              // Grant push that couldn't be delivered at grant time (no token).
              push = P.push3;
              flagUpdates[P.push3.flag] = true;
            }

            if (push !== null && (await userHasFcmToken(userRef))) {
              await queuePush(db, userRef, push);
              await userRef.update(flagUpdates);
              sentCount++;
            }
            continue;
          }

          // Unlock window has passed.
          if (status === "manual") {
            // Just ended → revoke access.
            await userRef.update({
              plusmember: false,
              subscription_status: "manualExpired",
            });
            revokedCount++;
          }
          // Send the end push (once) — works whether we just revoked or the
          // client already flipped the status to 'manualExpired'.
          if (
            data[P.push6.flag] !== true &&
            (await userHasFcmToken(userRef))
          ) {
            await queuePush(db, userRef, P.push6);
            await userRef.update({ [P.push6.flag]: true });
            sentCount++;
          }
          continue;
        }

        // ══ PHASE A: pre-unlock (never granted) ══
        // A real store trial already started → not a no-trial user.
        if (toMillis(data.trial_started_at) !== null) continue;

        const elapsedHours = (nowMs - createdMs) / hourMs;

        if (elapsedHours >= H.unlockAt) {
          // Day 7: GRANT Full Unlock (time-driven; even without a token).
          const endsAt = new Date(nowMs + H.unlockDuration * hourMs);
          const grant = {
            plusmember: true,
            subscription_status: "manual",
            trial_started_at: admin.firestore.Timestamp.fromMillis(nowMs),
            trial_ends_at: admin.firestore.Timestamp.fromDate(endsAt),
            full_unlock_used: true,
            [P.push1.flag]: true, // pre-unlock pushes no longer relevant
            [P.push2.flag]: true,
          };
          if (await userHasFcmToken(userRef)) {
            await queuePush(db, userRef, P.push3);
            grant[P.push3.flag] = true;
            sentCount++;
          }
          await userRef.update(grant);
          grantedCount++;
        } else if (elapsedHours >= H.push2 && data[P.push2.flag] !== true) {
          if (await userHasFcmToken(userRef)) {
            await queuePush(db, userRef, P.push2);
            await userRef.update({
              [P.push1.flag]: true, // suppress the earlier one
              [P.push2.flag]: true,
            });
            sentCount++;
          }
        } else if (elapsedHours >= H.push1 && data[P.push1.flag] !== true) {
          if (await userHasFcmToken(userRef)) {
            await queuePush(db, userRef, P.push1);
            await userRef.update({ [P.push1.flag]: true });
            sentCount++;
          }
        }
      } catch (e) {
        console.error(`noTrialPushScheduler error for ${doc.id}: ${e}`);
      }
    }

    console.log(
      `noTrialPushScheduler: sent ${sentCount}, granted ${grantedCount}, revoked ${revokedCount}`,
    );
    return null;
  });

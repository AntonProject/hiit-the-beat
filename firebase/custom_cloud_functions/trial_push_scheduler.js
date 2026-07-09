const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

// ── TEST MODE ──────────────────────────────────────────────────────────────
// true  → test thresholds (1/2/3 days). false → production (48/120/144 hours).
// The schedule is always hourly. When several pushes are overdue at once (e.g.
// a user who onboarded late), only the LATEST due push is sent and the earlier
// overdue ones are marked sent (suppressed) so they never fire afterwards.
const TEST_MODE = true;

// Delivery happens via the FlutterFlow trigger on ff_push_notifications.
// ff_user_push_notifications has NO trigger in this project yet, so writing
// there creates the doc + sets the flag but never delivers the push. Keep this
// on the working collection until a trigger for ff_user_push_notifications exists.
const kUserPushCollection = "ff_push_notifications";

// ── ELIGIBILITY CUTOFF ──────────────────────────────────────────────────────
// Trial pushes only go to users who registered on/after this date, OR whose
// trial started on/after this date. This protects pre-existing users from
// getting pushes for a trial that began before this feature existed.
// Placeholder: set to today for now — update to the real rollout date before
// going live (or whenever you want the cutoff to be).
const kCutoffDate = new Date("2026-06-01T00:00:00Z");
const kCutoffMs = kCutoffDate.getTime();

// `delay` = production threshold (hours after trial start). `testDelay` = test
// threshold (hours; 24/48/72 = 1/2/3 days). #1/#2 only go to users with zero
// completed workouts; #3 goes to every still-active trial user. Order ascending.
const kPushes = [
  {
    flag: "trial_48h_push_sent",
    delay: 48,
    testDelay: 24,
    requireZeroWorkouts: true,
    title: "Your first workout is waiting 🎵",
    body: "Just hit play and rock the beat.",
    page: "SeasonWorkoutPage",
  },
  {
    flag: "trial_120h_push_sent",
    delay: 120,
    testDelay: 48,
    requireZeroWorkouts: true,
    title: "Train like never before",
    body: "You downloaded this for a reason. Trial ends in 2 days.",
    page: "SeasonWorkoutPage",
  },
  {
    flag: "trial_144h_push_sent",
    delay: 144,
    testDelay: 72,
    requireZeroWorkouts: false,
    title: "Trial ends tomorrow",
    body: "No other workout feels like this. Don’t let it go.",
    page: "SubscriptionPage",
  },
];

// Normalize Firestore Timestamp / Date / ISO string / millis to epoch millis.
function toMillis(value) {
  if (value == null) return null;
  if (typeof value.toMillis === "function") return value.toMillis();
  if (value instanceof Date) return value.getTime();
  if (typeof value === "number") return value;
  const parsed = Date.parse(value);
  return Number.isNaN(parsed) ? null : parsed;
}

// A token in the fcm_tokens subcollection means the user granted permission
// (the client only writes a token when authorizationStatus == authorized).
async function userHasFcmToken(userRef) {
  const tokens = await userRef.collection("fcm_tokens").limit(1).get();
  return !tokens.empty;
}

// Completed workouts live in the user's progress doc (workout_done array).
async function completedWorkoutsCount(userData) {
  const progressRef = userData.progress;
  if (!progressRef || typeof progressRef.get !== "function") return 0;
  try {
    const snap = await progressRef.get();
    if (!snap.exists) return 0;
    const workoutDone = snap.data().workout_done;
    return Array.isArray(workoutDone) ? workoutDone.length : 0;
  } catch (e) {
    return 0;
  }
}

// Hand the push to the FlutterFlow pipeline. Same field shape as broadcast
// pushes; an empty scheduled_time makes the onCreate trigger deliver at once,
// with tap navigation driven by initial_page_name.
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

exports.trialPushScheduler = functions
  .runWith({
    timeoutSeconds: 540,
    memory: "512MB",
  })
  .pubsub.schedule("0 * * * *") // hourly, in both test and prod modes
  .timeZone("UTC")
  .onRun(async (context) => {
    const db = admin.firestore();
    const nowMs = Date.now();

    const trialUsers = await db
      .collection("users")
      .where("subscription_status", "==", "trial")
      .get();

    if (trialUsers.empty) {
      console.log("trialPushScheduler: no trial users");
      return null;
    }

    let sentCount = 0;
    let expiredCount = 0;

    for (const doc of trialUsers.docs) {
      try {
        const data = doc.data();
        const userRef = doc.ref;

        const startMs = toMillis(data.trial_started_at);
        const endMs = toMillis(data.trial_ends_at);

        // Trial ended without subscribing -> mark trialExpired, stop pushes.
        if (endMs !== null && nowMs >= endMs) {
          await userRef.update({ subscription_status: "trialExpired" });
          expiredCount++;
          continue;
        }

        if (startMs === null) continue; // cannot schedule without a start time

        // Skip users who registered before the cutoff AND started their trial
        // before it too — i.e. only proceed if EITHER happened after cutoff.
        const createdMs = toMillis(data.created_time);
        const registeredAfterCutoff = createdMs !== null && createdMs >= kCutoffMs;
        const trialStartedAfterCutoff = startMs >= kCutoffMs;
        if (!registeredAfterCutoff && !trialStartedAfterCutoff) continue;

        const elapsedHours = (nowMs - startMs) / (60 * 60 * 1000);

        // Collect every push that is due (threshold passed), not yet sent, and
        // (for #1/#2) allowed by the zero-workouts rule.
        let workouts = null;
        const eligible = [];
        for (const push of kPushes) {
          if (data[push.flag] === true) continue;
          const threshold = TEST_MODE ? push.testDelay : push.delay;
          if (elapsedHours < threshold) continue;
          if (push.requireZeroWorkouts) {
            if (workouts === null) {
              workouts = await completedWorkoutsCount(data);
            }
            if (workouts > 0) continue; // completed a workout -> never send
          }
          eligible.push(push);
        }

        if (eligible.length === 0) continue;

        // No token / permission -> skip and retry next run (don't set flags).
        const hasToken = await userHasFcmToken(userRef);
        if (!hasToken) continue;

        // Send only the LATEST overdue push; mark all overdue ones as sent so
        // the earlier ones are suppressed and never fire later.
        const latest = eligible[eligible.length - 1];
        await queuePush(db, userRef, latest);

        const flagUpdates = {};
        for (const p of eligible) {
          flagUpdates[p.flag] = true;
        }
        await userRef.update(flagUpdates);
        sentCount++;
      } catch (e) {
        console.error(`trialPushScheduler error for ${doc.id}: ${e}`);
      }
    }

    console.log(
      `trialPushScheduler: sent ${sentCount} push(es), expired ${expiredCount} user(s)`,
    );
    return null;
  });

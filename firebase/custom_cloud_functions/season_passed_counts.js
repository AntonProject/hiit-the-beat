const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

const CACHE_DOC = "admin_stats/passed_counts";
const CACHE_TTL_MS = 30 * 60 * 1000;

exports.seasonPassedCounts = functions
  .region("europe-west3")
  .runWith({
    // 512MB holds one 1000-document page plus the season/user accumulator with
    // room to spare. Going down to 256MB is tempting, but CPU on Cloud
    // Functions scales with memory (400MHz there against 800MHz here) and this
    // job is CPU-bound on parsing nested arrays — it would run about twice as
    // long for the same GB-seconds, just closer to the timeout.
    timeoutSeconds: 300,
    memory: "512MB",
  })
  .https.onCall(async (data, context) => {
    if (!context.auth) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "Sign in required.",
      );
    }

    const db = admin.firestore();

    // Only an admin may see aggregate statistics. The Firestore rules make the
    // same check, but a callable runs with admin credentials and bypasses them,
    // so it has to be repeated here.
    const callerSnap = await db.collection("users").doc(context.auth.uid).get();
    const role = callerSnap.exists ? callerSnap.data().role : null;
    const roles = (context.auth.token && context.auth.token.roles) || [];
    const isAdmin =
      role === "admin" || roles.includes("ADMIN") || roles.includes("OWNER");

    if (!isAdmin) {
      throw new functions.https.HttpsError(
        "permission-denied",
        "Admin role required.",
      );
    }

    const cacheRef = db.doc(CACHE_DOC);

    // Serve the stored result unless it has aged out or the caller asked for a
    // new scan. One document read instead of tens of thousands.
    if (!(data && data.refresh)) {
      const cached = await cacheRef.get();
      if (cached.exists) {
        const stored = cached.data();
        const age = Date.now() - (stored.computedAt || 0);
        if (age < CACHE_TTL_MS) {
          return {
            counts: stored.counts || {},
            workouts: stored.workouts || {},
            scanned: stored.scanned || 0,
            computedAt: stored.computedAt || 0,
            cached: true,
          };
        }
      }
    }

    try {
      const perSeason = {};
      const perWorkout = {};
      let scanned = 0;

      // Streamed in pages so a large collection never has to sit in memory at
      // once, and paged by document id so no document can be skipped.
      const pageSize = 1000;
      let cursor = null;

      for (;;) {
        let query = db
          .collection("progress")
          // Only the three fields the tally needs. A progress document also
          // carries the per-exercise history, which is by far the bulk of it
          // and would otherwise be serialised and parsed for nothing.
          .select("user", "season_done", "workout_done")
          .orderBy(admin.firestore.FieldPath.documentId())
          .limit(pageSize);
        if (cursor) query = query.startAfter(cursor);

        const snap = await query.get();
        if (snap.empty) break;

        snap.docs.forEach((doc) => {
          scanned += 1;
          const data = doc.data();
          const user = data.user;
          if (!user) return;

          // `user` is a DocumentReference; its id identifies the person.
          const userId = user.id || String(user);
          const done = Array.isArray(data.season_done) ? data.season_done : [];

          done.forEach((entry) => {
            const seasonId = entry && entry.seasonId;
            if (!seasonId) return;
            if (!perSeason[seasonId]) perSeason[seasonId] = new Set();
            perSeason[seasonId].add(userId);
          });

          const workoutsDone = Array.isArray(data.workout_done)
            ? data.workout_done
            : [];

          workoutsDone.forEach((entry) => {
            if (!entry) return;
            const seasonId = entry.seasonId;
            const workoutId = entry.workoutId;
            if (!seasonId || !workoutId) return;
            const key = `${seasonId}|${workoutId}`;
            if (!perWorkout[key]) perWorkout[key] = new Set();
            perWorkout[key].add(userId);
          });
        });

        if (snap.size < pageSize) break;
        cursor = snap.docs[snap.docs.length - 1];
      }

      const counts = {};
      Object.keys(perSeason).forEach((seasonId) => {
        counts[seasonId] = perSeason[seasonId].size;
      });

      const workouts = {};
      Object.keys(perWorkout).forEach((key) => {
        workouts[key] = perWorkout[key].size;
      });

      console.log(
        `seasonPassedCounts: scanned ${scanned} progress docs, ` +
          `${Object.keys(counts).length} seasons and ` +
          `${Object.keys(workouts).length} workouts with completions`,
      );

      const computedAt = Date.now();

      // Stored for the next caller. A failure here is not worth failing the
      // call over — the numbers are already computed and correct.
      await cacheRef
        .set({ counts, workouts, scanned, computedAt })
        .catch((error) => console.error("passed counts not cached", error));

      return { counts, workouts, scanned, computedAt, cached: false };
    } catch (error) {
      console.error("seasonPassedCounts failed", error);
      throw new functions.https.HttpsError(
        "internal",
        "Could not compute season statistics.",
      );
    }
  });

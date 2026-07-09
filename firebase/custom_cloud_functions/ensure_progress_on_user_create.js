const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

// Number of completed workouts in a progress doc (workout_done array length).
function workoutCount(doc) {
  const wd = doc.data().workout_done;
  return Array.isArray(wd) ? wd.length : 0;
}

// On users/{userId} creation, guarantee exactly one linked progress doc:
//   - none        -> create one and link users.progress to it
//   - one         -> link users.progress to it (if not already)
//   - duplicates  -> keep the one with the most workout_done, DELETE the empty
//                    duplicates (never delete a doc that has workouts), and link
//                    users.progress to the kept one.
exports.ensureProgressOnUserCreate = functions
  .runWith({
    timeoutSeconds: 60,
    memory: "128MB",
  })
  .firestore.document("users/{userId}")
  .onCreate(async (snap, context) => {
    const db = admin.firestore();
    const userRef = snap.ref;

    try {
      const existing = await db
        .collection("progress")
        .where("user", "==", userRef)
        .get();

      // No progress doc yet -> create and link.
      if (existing.empty) {
        const progressRef = db.collection("progress").doc();
        await progressRef.set({ user: userRef });

        const update = { progress: progressRef };
        if (snap.data().current_level == null) {
          update.current_level = 1;
        }
        await userRef.update(update);

        console.log(`ensureProgress: created progress for ${userRef.id}`);
        return null;
      }

      // Keep the doc with the most completed workouts.
      const docs = existing.docs
        .slice()
        .sort((a, b) => workoutCount(b) - workoutCount(a));
      const keep = docs[0];

      // Delete only EMPTY duplicates; never remove a doc that has workouts.
      let deleted = 0;
      for (const dup of docs.slice(1)) {
        if (workoutCount(dup) === 0) {
          await dup.ref.delete();
          deleted++;
        } else {
          console.warn(
            `ensureProgress: ${userRef.id} has multiple non-empty progress docs ` +
              `(${dup.id}) — left for manual review`,
          );
        }
      }

      // Point users.progress at the kept doc.
      const current = snap.data().progress;
      if (!current || current.path !== keep.ref.path) {
        await userRef.update({ progress: keep.ref });
      }

      console.log(
        `ensureProgress: ${userRef.id} kept ${keep.id}, deleted ${deleted} empty dup(s)`,
      );
      return null;
    } catch (e) {
      console.error(`ensureProgress error for ${userRef.id}: ${e}`);
      return null;
    }
  });

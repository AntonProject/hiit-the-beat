const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

/**
 * Keeps exactly one pinned exercise in `levels_exercises`.
 *
 * The app shows the pinned one first, with a gradient border, so two at once
 * is meaningless. Rather than a callable the admin has to remember to invoke,
 * this watches the flag itself: pin whichever exercise you like, from the
 * FlutterFlow admin, the web admin or the Firebase console, and the previous
 * one is released. Nothing has to be wired into a save action.
 *
 * Only a false -> true transition does any work. The releases it writes set
 * `fixed` to false, which re-enters this function for those documents and
 * stops at the first check, so there is no loop.
 */
exports.fixedLevelExercise = functions
  .region("europe-west3")
  .runWith({
    // A handful of documents and one batch — the smallest tier is plenty.
    timeoutSeconds: 60,
    memory: "256MB",
  })
  .firestore.document("levels_exercises/{exerciseId}")
  .onWrite(async (change, context) => {
    const after = change.after.exists ? change.after.data() : null;

    // Deleted, or not the pinned one: nothing to release.
    if (!after || after.fixed !== true) return null;

    // Already pinned before this write — an edit to some other field.
    const before = change.before.exists ? change.before.data() : null;
    if (before && before.fixed === true) return null;

    const pinnedId = context.params.exerciseId;
    const db = admin.firestore();
    const collection = db.collection("levels_exercises");

    try {
      // In a transaction, and re-reading the document that triggered this
      // first. Two pins seconds apart would otherwise release each other and
      // leave nothing pinned: each run still sees the other as pinned and
      // clears it. Bailing out when this one has already been released in the
      // meantime means whichever run commits first decides, and exactly one
      // exercise survives either way.
      const released = await db.runTransaction(async (tx) => {
        const target = await tx.get(collection.doc(pinnedId));
        if (!target.exists || target.data().fixed !== true) return -1;

        const stillPinned = await tx.get(collection.where("fixed", "==", true));

        let count = 0;
        stillPinned.docs.forEach((doc) => {
          if (doc.id === pinnedId) return;
          tx.update(doc.ref, { fixed: false });
          count += 1;
        });
        return count;
      });

      console.log(
        released < 0
          ? `fixedLevelExercise: ${pinnedId} was released meanwhile, left alone`
          : `fixedLevelExercise: ${pinnedId} pinned, ${released} released`,
      );
    } catch (error) {
      // Throwing would retry the write and could fight a newer pin; the flag
      // on the document the admin just set is correct either way.
      console.error("fixedLevelExercise failed", error);
    }

    return null;
  });

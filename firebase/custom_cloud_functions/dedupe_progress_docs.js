const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

// One-time maintenance (callable): for every user, keep the progress doc with
// the most completed workouts, delete the EMPTY duplicates (never a doc that
// has workouts), and repoint users.progress at the kept doc.
// Dry-run by default — call with { dryRun: false } to actually write.
// Delete this function after the cleanup run.

function workoutCount(docData) {
  const wd = docData.workout_done;
  return Array.isArray(wd) ? wd.length : 0;
}

exports.dedupeProgressDocs = functions
  .runWith({
    timeoutSeconds: 540,
    memory: "256MB",
  })
  .https.onCall(async (data, context) => {
    // Reports only unless explicitly called with { dryRun: false }.
    const dryRun = (data && data.dryRun) !== false;

    const db = admin.firestore();

    // Pass over the whole progress collection, grouping doc paths + workout
    // counts by owning user (only paths/counts kept, so memory stays small).
    const byUser = new Map(); // userPath -> [{ path, count }]
    let orphans = 0;
    let lastDoc = null;
    const pageSize = 500;

    while (true) {
      let q = db
        .collection("progress")
        .orderBy(admin.firestore.FieldPath.documentId())
        .limit(pageSize);
      if (lastDoc) q = q.startAfter(lastDoc);

      const snap = await q.get();
      if (snap.empty) break;

      for (const doc of snap.docs) {
        const d = doc.data();
        const userRef = d.user;
        if (!userRef || typeof userRef.path !== "string") {
          orphans++;
          continue;
        }
        const arr = byUser.get(userRef.path) || [];
        arr.push({ path: doc.ref.path, count: workoutCount(d) });
        byUser.set(userRef.path, arr);
      }

      lastDoc = snap.docs[snap.docs.length - 1];
      if (snap.size < pageSize) break;
    }

    let usersWithDupes = 0;
    let deleted = 0;
    let relinked = 0;
    let nonEmptyConflicts = 0;

    // Batch the reads (getAll) and writes (BulkWriter) so the whole base is
    // processed in parallel instead of one sequential round-trip per user.
    const writer = db.bulkWriter();
    const entries = Array.from(byUser.entries());
    const readChunk = 200;

    for (let i = 0; i < entries.length; i += readChunk) {
      const chunk = entries.slice(i, i + readChunk);
      const userSnaps = await db.getAll(...chunk.map(([p]) => db.doc(p)));

      chunk.forEach(([userPath, docs], idx) => {
        docs.sort((a, b) => b.count - a.count); // most workouts first
        const keep = docs[0];
        if (docs.length > 1) usersWithDupes++;

        // Delete only EMPTY duplicates; keep any doc that holds workouts.
        for (const dup of docs.slice(1)) {
          if (dup.count === 0) {
            if (!dryRun) writer.delete(db.doc(dup.path));
            deleted++;
          } else {
            nonEmptyConflicts++;
            console.warn(
              `dedupe: ${userPath} has multiple non-empty progress docs (${dup.path}) — left for manual review`,
            );
          }
        }

        // Repoint users.progress at the kept doc if needed.
        const userSnap = userSnaps[idx];
        if (userSnap.exists) {
          const current = userSnap.data().progress;
          if (!current || current.path !== keep.path) {
            if (!dryRun) writer.update(db.doc(userPath), { progress: db.doc(keep.path) });
            relinked++;
          }
        }
      });
    }

    if (!dryRun) await writer.close(); // flush all queued writes

    const summary = {
      dryRun,
      usersScanned: byUser.size,
      usersWithDupes,
      emptyDuplicatesDeleted: deleted,
      usersRelinked: relinked,
      nonEmptyConflicts,
      orphanProgressDocs: orphans,
    };
    console.log(`dedupeProgressDocs: ${JSON.stringify(summary)}`);
    return summary;
  });

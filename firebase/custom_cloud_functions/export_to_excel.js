const functions = require("firebase-functions");
const admin = require("firebase-admin");
const XLSX = require("xlsx");
const { randomUUID } = require("crypto");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.exportToExcel = functions
  .region("europe-west3")
  .runWith({
    timeoutSeconds: 540,
    memory: "2GB",
  })
  .https.onCall(async (data, context) => {
    console.log("Function started");

    try {
      const db = admin.firestore();

      const workoutsSnapshot = await db.collection("workouts").get();
      const workoutsPoints = workoutsSnapshot.docs.map(
        (doc) => doc.data().points || 0,
      );
      const totalPossiblePoints = workoutsPoints.reduce(
        (sum, points) => sum + (points + 4),
        0,
      );

      console.log("Getting users");
      const snapshot = await db.collection("users").get();

      // One pass over progress, keyed by user, instead of a query per user.
      // The old loop issued one sequential query for each of ~30k users, which
      // could not finish inside the callable's deadline — the caller gave up
      // with deadline-exceeded long before the function itself timed out.
      console.log("Getting progress");
      const doneByUser = new Map();
      let progressCursor = null;
      for (;;) {
        let progressQuery = db
          .collection("progress")
          .select("user", "workout_done")
          .orderBy(admin.firestore.FieldPath.documentId())
          .limit(1000);
        if (progressCursor) {
          progressQuery = progressQuery.startAfter(progressCursor);
        }

        const page = await progressQuery.get();
        if (page.empty) break;

        page.docs.forEach((progressDoc) => {
          const progressData = progressDoc.data();
          if (!progressData.user) return;
          if (!Array.isArray(progressData.workout_done)) return;

          const userId = progressData.user.id;
          const existing = doneByUser.get(userId);
          if (existing) {
            existing.push(...progressData.workout_done);
          } else {
            doneByUser.set(userId, [...progressData.workout_done]);
          }
        });

        if (page.size < 1000) break;
        progressCursor = page.docs[page.docs.length - 1];
      }
      const excelData = [];
      const allFields = new Set();

      snapshot.forEach((doc) => {
        const data = doc.data();
        Object.keys(data).forEach((key) => allFields.add(key));
      });

      allFields.add("progress");

      for (const doc of snapshot.docs) {
        const data = doc.data();
        const rowData = {};

        allFields.forEach((field) => {
          if (field === "progress") return;

          let value = data[field];

          if (value instanceof admin.firestore.Timestamp) {
            value = value.toDate().toISOString();
          } else if (value instanceof admin.firestore.DocumentReference) {
            value = value.path;
          } else if (Array.isArray(value)) {
            value = value.join(", ");
          } else if (typeof value === "object" && value !== null) {
            try {
              value = JSON.stringify(value);
            } catch (e) {
              value = "[Complex Object]";
            }
          }

          rowData[field] = value ?? "";
        });

        const allWorkoutDone = doneByUser.get(doc.id) || [];

        // Scored exactly as totalPointsProgress does in the app, so the column
        // here means the same thing as the one on the admin's user list.
        //
        // Three things were off before. The warm-up key is stored as
        // "warpmupPoints" — the typo is in the data — so reading warmupPoints
        // always found nothing and fell back to 2. And || treats a stored 0 as
        // missing, which turned an honest zero into the default; the app uses
        // ?? there. Defaults themselves differ too: the app starts the workout
        // score at 0, not 2.
        const bestScores = {};
        for (const workout of allWorkoutDone) {
          const workoutId = workout.workoutId;
          const totalScore =
            (workout.workoutPoints ?? 0) +
            (workout.warpmupPoints ?? 2) +
            (workout.cooldownPoints ?? 2);

          if (!bestScores[workoutId] || bestScores[workoutId] < totalScore) {
            bestScores[workoutId] = totalScore;
          }
        }

        const userEarnedPoints = Object.values(bestScores).reduce(
          (sum, points) => sum + points,
          0,
        );
        const ratio =
          totalPossiblePoints === 0
            ? 0
            : userEarnedPoints / totalPossiblePoints;
        // The app caps at 100%; without this a user who beat every workout
        // twice could read above it.
        const progress = ratio > 1 ? 1 : ratio;

        rowData.progress = Number((progress * 100).toFixed(2));

        excelData.push(rowData);
      }

      console.log("Creating Excel file");
      const workbook = XLSX.utils.book_new();
      const worksheet = XLSX.utils.json_to_sheet(excelData);
      XLSX.utils.book_append_sheet(workbook, worksheet, "Users");

      const excelBuffer = XLSX.write(workbook, {
        type: "buffer",
        bookType: "xlsx",
        bookSST: false,
        compression: true,
      });

      const now = new Date();
      const day = String(now.getDate()).padStart(2, "0");
      const month = String(now.getMonth() + 1).padStart(2, "0");
      const year = now.getFullYear();
      const dateString = `${day}${month}${year}`;

      console.log("Saving to Storage");
      const bucket = admin.storage().bucket("breakletics-9245d.appspot.com");
      const fileName = `exports/users_export_${dateString}.xlsx`;
      const file = bucket.file(fileName);

      // A fresh token on every export, so the link handed out last time
      // stops working as soon as a new one is made.
      const downloadToken = randomUUID();

      await file.save(excelBuffer, {
        metadata: {
          contentType:
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
          cacheControl: "private, max-age=0, no-store",
          // Makes the browser save the file instead of deciding for itself
          // what to do with the link, and gives it a name worth keeping.
          contentDisposition: `attachment; filename="users_export_${dateString}.xlsx"`,
          metadata: { firebaseStorageDownloadTokens: downloadToken },
        },
      });

      // Not makePublic(): that left every export readable by anyone who could
      // guess the name, and the name is only a date. Signed URLs would be
      // better still — they expire — but signing needs the runtime service
      // account to hold iam.serviceAccounts.signBlob, which it does not.
      console.log("Returning a tokenised link");

      return (
        `https://firebasestorage.googleapis.com/v0/b/${bucket.name}` +
        `/o/${encodeURIComponent(fileName)}?alt=media&token=${downloadToken}`
      );
    } catch (error) {
      console.error("Export error:", error);
      throw new functions.https.HttpsError(
        "internal",
        "Failed to export data: " + error.message,
      );
    }
  });

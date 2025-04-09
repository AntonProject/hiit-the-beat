const functions = require("firebase-functions");
const admin = require("firebase-admin");
const XLSX = require("xlsx");
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

        const progressSnapshot = await db
          .collection("progress")
          .where("user", "==", doc.ref)
          .get();

        const allWorkoutDone = [];
        progressSnapshot.docs.forEach((progressDoc) => {
          const progressData = progressDoc.data();
          if (
            progressData.workout_done &&
            Array.isArray(progressData.workout_done)
          ) {
            allWorkoutDone.push(...progressData.workout_done);
          }
        });

        const bestScores = {};
        for (const workout of allWorkoutDone) {
          const workoutId = workout.workoutId;
          const totalScore =
            (workout.workoutPoints || 2) +
            (workout.warmupPoints || 2) +
            (workout.cooldownPoints || 2);

          if (!bestScores[workoutId] || bestScores[workoutId] < totalScore) {
            bestScores[workoutId] = totalScore;
          }
        }

        const userEarnedPoints = Object.values(bestScores).reduce(
          (sum, points) => sum + points,
          0,
        );
        const progress = userEarnedPoints / totalPossiblePoints;

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

      await file.save(excelBuffer, {
        metadata: {
          contentType:
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
          cacheControl: "public, max-age=3600",
        },
      });

      console.log("Making file public");
      await file.makePublic();

      const publicUrl = `https://firebasestorage.googleapis.com/v0/b/${bucket.name}/o/${encodeURIComponent(fileName)}?alt=media`;

      return publicUrl;
    } catch (error) {
      console.error("Export error:", error);
      throw new functions.https.HttpsError(
        "internal",
        "Failed to export data: " + error.message,
      );
    }
  });

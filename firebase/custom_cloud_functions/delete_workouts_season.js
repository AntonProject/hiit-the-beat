const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.deleteWorkoutsSeason = functions
  .region("europe-west3")
  .runWith({
    timeoutSeconds: 540,
    memory: "128MB",
  })
  .https.onCall(async (data, context) => {
    // Write your code below!
    const seasonId = data.seasonId;
    const db = admin.firestore();
    const batch = db.batch();
    let deletedCount = 0;
    let orphanedCount = 0;

    try {
      // Проверяем существование сезона
      const seasonRef = db.collection("seasons").doc(seasonId);
      const seasonDoc = await seasonRef.get();

      // Получаем все воркауты
      const workoutsSnapshot = await db.collection("workouts").get();

      for (const doc of workoutsSnapshot.docs) {
        const workout = doc.data();

        if (workout.season_id === seasonId) {
          // Удаляем воркауты с указанным season_id
          batch.delete(doc.ref);
          deletedCount++;
        } else if (workout.season_id) {
          // Проверяем существование связанного сезона
          const linkedSeasonRef = db
            .collection("seasons")
            .doc(workout.season_id);
          const linkedSeasonDoc = await linkedSeasonRef.get();

          if (!linkedSeasonDoc.exists) {
            // Удаляем воркауты с несуществующими сезонами
            batch.delete(doc.ref);
            orphanedCount++;
          }
        }
      }

      await batch.commit();

      return {
        success: true,
        message: `Successfully processed workouts. Deleted ${deletedCount} workouts from specified season and ${orphanedCount} orphaned workouts.`,
        deletedCount,
        orphanedCount,
      };
    } catch (error) {
      console.error("Error in deleteWorkoutsSeason:", error);
      throw new functions.https.HttpsError(
        "internal",
        "Error processing workouts deletion",
        error.message,
      );
    }
    // Write your code above!
  });

const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.lifetimeCheck = functions
  .runWith({
    timeoutSeconds: 540,
    memory: "256MB",
  })
  .pubsub.schedule("0 0 * * *")
  .onRun(async (context) => {
    try {
      const currentTime = Date.now();

      const usersRef = admin.firestore().collection("users");
      // Получаем всех пользователей с активными подписками
      const expiredUsersSnapshot = await usersRef
        .where("lifetime", "==", true)
        .where("plusmember", "==", true)
        .get();

      if (expiredUsersSnapshot.empty) {
        console.log("No users with active subscriptions found");
        return null;
      }

      const batch = admin.firestore().batch();
      let updateCount = 0;

      // Проверяем каждого пользователя на наличие и значение expired_at
      expiredUsersSnapshot.forEach((doc) => {
        const userData = doc.data();
        // Проверяем что expired_at существует и меньше текущего времени
        if (userData.expired_at && userData.expired_at < currentTime) {
          batch.update(doc.ref, {
            lifetime: false,
            plusmember: false,
          });
          updateCount++;
        }
      });

      // Если есть что обновлять, выполняем batch
      if (updateCount > 0) {
        await batch.commit();
        console.log(
          `Successfully updated ${updateCount} users. Updated users IDs: ${updatedUserIds.join(", ")}`,
        );
      } else {
        console.log("No users needed updating");
      }

      return null;
    } catch (error) {
      console.error("Error updating user subscriptions:", error);
      throw error;
    }
  });

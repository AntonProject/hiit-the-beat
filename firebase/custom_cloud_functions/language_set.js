const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.languageSet = functions
  .runWith({
    timeoutSeconds: 540,
    memory: "512MB",
  })
  .pubsub.schedule("0 * * * *") // Run every hour (fixed cron expression)
  .onRun(async (context) => {
    // Write your code below!

    // Get reference to the users collection
    const usersRef = admin.firestore().collection("users");

    try {
      // Query users where language field is null or doesn't exist
      const snapshot = await usersRef.where("language", "==", null).get();
      const nullLanguageUsers = snapshot.docs;

      // Query for users where language field doesn't exist
      const snapshot2 = await usersRef.get();
      const noLanguageUsers = snapshot2.docs.filter(
        (doc) => !doc.data().hasOwnProperty("language"),
      );

      // Combine both arrays to get all users without language
      const usersToUpdate = [...nullLanguageUsers, ...noLanguageUsers];

      // Remove duplicates (if any)
      const uniqueUsersToUpdate = [
        ...new Map(usersToUpdate.map((doc) => [doc.id, doc])).values(),
      ];

      console.log(
        `Found ${uniqueUsersToUpdate.length} users without language setting`,
      );

      // If no users need updating, exit early
      if (uniqueUsersToUpdate.length === 0) {
        console.log("No users to update");
        return null;
      }

      // Create a batch for better performance
      const batch = admin.firestore().batch();

      // Add each user to batch update
      uniqueUsersToUpdate.forEach((doc) => {
        batch.update(doc.ref, { language: "en" });
      });

      // Commit the batch
      await batch.commit();

      console.log(
        `Successfully updated language to 'en' for ${uniqueUsersToUpdate.length} users`,
      );

      return null;
    } catch (error) {
      console.error("Error updating user languages:", error);
      return null;
    }
    // Write your code above!
  });

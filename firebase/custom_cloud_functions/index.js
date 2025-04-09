const admin = require("firebase-admin/app");
admin.initializeApp();

const exportToExcel = require("./export_to_excel.js");
exports.exportToExcel = exportToExcel.exportToExcel;
const deleteWorkoutsSeason = require("./delete_workouts_season.js");
exports.deleteWorkoutsSeason = deleteWorkoutsSeason.deleteWorkoutsSeason;
const lifetimeCheck = require("./lifetime_check.js");
exports.lifetimeCheck = lifetimeCheck.lifetimeCheck;
const languageSet = require("./language_set.js");
exports.languageSet = languageSet.languageSet;

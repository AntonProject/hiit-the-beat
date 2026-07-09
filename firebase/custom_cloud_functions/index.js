const admin = require("firebase-admin/app");
admin.initializeApp();

const exportToExcel = require("./export_to_excel.js");
exports.exportToExcel = exportToExcel.exportToExcel;
const deleteWorkoutsSeason = require("./delete_workouts_season.js");
exports.deleteWorkoutsSeason = deleteWorkoutsSeason.deleteWorkoutsSeason;
const languageSet = require("./language_set.js");
exports.languageSet = languageSet.languageSet;
const trialPushScheduler = require("./trial_push_scheduler.js");
exports.trialPushScheduler = trialPushScheduler.trialPushScheduler;
const ensureProgressOnUserCreate = require("./ensure_progress_on_user_create.js");
exports.ensureProgressOnUserCreate =
  ensureProgressOnUserCreate.ensureProgressOnUserCreate;
const dedupeProgressDocs = require("./dedupe_progress_docs.js");
exports.dedupeProgressDocs = dedupeProgressDocs.dedupeProgressDocs;
const noTrialPushScheduler = require("./no_trial_push_scheduler.js");
exports.noTrialPushScheduler = noTrialPushScheduler.noTrialPushScheduler;

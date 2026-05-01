// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<WorkoutsRecord?> workoutById(
  String workoutId,
  List<WorkoutStatisticStruct>? workoutDone,
) async {
  // Get the current workout from Firestore
  final DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection('workouts')
      .doc(workoutId)
      .get();

  if (!snapshot.exists) {
    return null; // Return null if the document does not exist
  }

  // Convert to WorkoutsRecord
  final currentWorkout = WorkoutsRecord.fromSnapshot(snapshot);

  // Count how many times this workout has been completed
  int completionCount = 0;

  if (workoutDone != null && workoutDone.isNotEmpty) {
    completionCount =
        workoutDone.where((stat) => stat.workoutId == workoutId).length;
  }

  // If workout has been completed less than 3 times, return it
  if (completionCount < 3) {
    return currentWorkout;
  }

  // If the workout has been completed 3 or more times, get the next workout
  // Get the current workout's season_id and index
  final String currentSeasonId = currentWorkout.seasonId;
  final int currentIndex = currentWorkout.index;

  // Query for the next workout in the same season with index + 1
  final QuerySnapshot nextWorkoutQuery = await FirebaseFirestore.instance
      .collection('workouts')
      .where('season_id', isEqualTo: currentSeasonId)
      .where('index', isEqualTo: currentIndex + 1)
      .limit(1)
      .get();

  // If found the next workout, return it
  if (nextWorkoutQuery.docs.isNotEmpty) {
    return WorkoutsRecord.fromSnapshot(nextWorkoutQuery.docs.first);
  }

  // If no next workout found, return the current one
  return currentWorkout;
}

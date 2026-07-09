// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<SeasonsRecord> seasonId(
    List<WorkoutStatisticStruct>? workoutDone) async {
  // Add your function code here!
  // Check if workoutDone is empty or null
  if (workoutDone == null || workoutDone.isEmpty) {
    // If no workouts done, return the first season sorted by number field
    final querySnapshot = await FirebaseFirestore.instance
        .collection('seasons')
        .orderBy('number', descending: false)
        .limit(1)
        .get();

    if (querySnapshot.docs.isEmpty) {
      throw Exception('No seasons found in the database');
    }

    return SeasonsRecord.fromSnapshot(querySnapshot.docs.first);
  }

  // Get the latest workout's seasonId
  Set<String> seasonIds = {};
  DateTime latestDateTime = DateTime(1970); // Starting with a very old date
  String latestSeasonId = '';

  // Find all seasonIds and determine the latest workout date
  for (var workout in workoutDone) {
    final seasonId = workout.seasonId;
    if (seasonId != null && seasonId.isNotEmpty) {
      seasonIds.add(seasonId);

      // Check if this workout has a datetime and if it's the latest
      if (workout.datetime != null &&
          workout.datetime!.isAfter(latestDateTime)) {
        latestDateTime = workout.datetime!;
        latestSeasonId = seasonId;
      }
    }
  }

  // If we found a seasonId from the latest workout
  if (latestSeasonId.isNotEmpty) {
    try {
      // Get the season document with the latest seasonId
      final docSnapshot = await FirebaseFirestore.instance
          .collection('seasons')
          .doc(latestSeasonId)
          .get();

      if (docSnapshot.exists) {
        return SeasonsRecord.fromSnapshot(docSnapshot);
      }
    } catch (e) {
      print('Error fetching season document: $e');
      // Continue to fallback if there's an error
    }
  }

  // Fallback: If no valid season found from workouts, get the first season by number
  final querySnapshot = await FirebaseFirestore.instance
      .collection('seasons')
      .orderBy('number', descending: false)
      .limit(1)
      .get();

  if (querySnapshot.docs.isEmpty) {
    throw Exception('No seasons found in the database');
  }

  return SeasonsRecord.fromSnapshot(querySnapshot.docs.first);
}

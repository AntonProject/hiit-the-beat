import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

int totalPointsLevel(List<WorkoutStatisticStruct>? workoutDone) {
  if (workoutDone == null || workoutDone.isEmpty) {
    return 0;
  }

  // Create a map to store the best score for each workout
  final Map<String, int> bestScores = {};

  // Iterate through all workouts and keep only the best score for each workout ID
  for (var workout in workoutDone) {
    final workoutId = workout.workoutId;
    final totalScore = (workout.workoutPoints ?? 0) +
        (workout.warpmupPoints ?? 0) +
        (workout.cooldownPoints ?? 0);

    // Save the best score for this workout
    if (!bestScores.containsKey(workoutId) ||
        bestScores[workoutId]! < totalScore) {
      bestScores[workoutId] = totalScore;
    }
  }

  // Sum up the best scores to get the total points
  final earnedPoints = bestScores.values.fold(0, (sum, points) => sum + points);

  return earnedPoints;
}

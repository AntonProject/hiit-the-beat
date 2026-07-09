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

double totalPointsProgress(
  List<WorkoutStatisticStruct>? workoutDone,
  List<int>? total,
) {
  if (workoutDone == null ||
      workoutDone.isEmpty ||
      total == null ||
      total.isEmpty) {
    return 0;
  }

  // Calculate sum of total possible points (за каждый воркаут по одному разу)
  final totalPoints = total.fold(0, (sum, points) => sum + (points + 4));

  // Calculate sum of earned points (только лучший результат для каждого воркаута)
  final Map<String, int> bestScores = {};

  for (var workout in workoutDone) {
    final workoutId = workout.workoutId;
    final totalScore = (workout.workoutPoints ?? 0) +
        (workout.warpmupPoints ?? 2) +
        (workout.cooldownPoints ?? 2);

    if (!bestScores.containsKey(workoutId) ||
        bestScores[workoutId]! < totalScore) {
      bestScores[workoutId] = totalScore;
    }
  }

  final earnedPoints = bestScores.values.fold(0, (sum, points) => sum + points);

  // Calculate progress (0 to 1)
  if (totalPoints == 0) return 0;
  return earnedPoints / totalPoints > 1 ? 1 : earnedPoints / totalPoints;
}

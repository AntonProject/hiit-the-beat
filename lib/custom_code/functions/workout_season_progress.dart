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

double workoutSeasonProgress(
  List<WorkoutStatisticStruct>? workoutDone,
  String seasonId,
  int? workoutCount,
) {
  if (workoutDone == null ||
      seasonId.isEmpty ||
      workoutCount == null ||
      workoutCount == 0) {
    return 0.0;
  }

  final seasonWorkouts =
      workoutDone.where((workout) => workout.seasonId == seasonId);

  final workoutCompletions = <String, int>{};

  for (var workout in seasonWorkouts) {
    workoutCompletions[workout.workoutId] =
        (workoutCompletions[workout.workoutId] ?? 0) + 1;
  }

  double totalProgress = 0.0;

  for (var count in workoutCompletions.values) {
    double workoutProgress = math.min(count / 3, 1.0);
    totalProgress += workoutProgress;
  }

  int missingWorkouts = workoutCount - workoutCompletions.length;

  return totalProgress / workoutCount;
}

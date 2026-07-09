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

int userWorkoutPassed(
  List<ProgressRecord>? progress,
  String seasonId,
  String workoutId,
) {
  if (progress == null || progress.isEmpty) return 0;

  Set<DocumentReference> uniqueUsers = {};

  for (final record in progress) {
    final hasWorkout = record.workoutDone?.any((workout) =>
            workout.seasonId == seasonId && workout.workoutId == workoutId) ??
        false;

    if (hasWorkout && record.user != null) {
      uniqueUsers.add(record.user!);
    }
  }

  return uniqueUsers.length ?? 0;
}

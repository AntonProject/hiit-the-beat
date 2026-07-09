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

int totalPoints(List<WorkoutStatisticStruct>? workoutDone) {
  if (workoutDone == null || workoutDone.isEmpty) {
    return 0;
  }

  return workoutDone.fold(0, (sum, workout) {
    final workoutPoints = workout.workoutPoints ?? 0;
    final warpmupPoints = workout.warpmupPoints ?? 0;
    final cooldownPoints = workout.cooldownPoints ?? 0;

    return sum + workoutPoints + warpmupPoints + cooldownPoints;
  });
}

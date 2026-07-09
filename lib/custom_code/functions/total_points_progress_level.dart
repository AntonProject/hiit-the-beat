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

double totalPointsProgressLevel(
  List<WorkoutStatisticStruct>? workoutDone,
  List<UserLevelStruct> levelsList,
) {
  // Check if workoutDone is null or empty.
  if (workoutDone == null || workoutDone.isEmpty) {
    return 0.0;
  }

  // Check if levelsList is empty
  if (levelsList.isEmpty) {
    return 0.0;
  }

  // Calculate total earned points from workout statistics
  int earnedPoints = 0;
  for (var workout in workoutDone) {
    final int workoutPoints = workout.workoutPoints ?? 0;
    final int warpmupPoints = workout.warpmupPoints ?? 0;
    final int cooldownPoints = workout.cooldownPoints ?? 0;
    earnedPoints += workoutPoints + warpmupPoints + cooldownPoints;
  }

  // Find current level based on total earned points
  int currentLevelIndex = 0;
  bool levelFound = false;

  for (int i = levelsList.length - 1; i >= 0; i--) {
    final int levelPoints = levelsList[i].points ?? 0;
    if (earnedPoints >= levelPoints) {
      currentLevelIndex = i;
      levelFound = true;
      break;
    }
  }

  // If no level found, stay at level 0
  if (!levelFound) {
    currentLevelIndex = 0;
  }

  // Get current level points
  final int currentLevelMinPoints = levelsList[currentLevelIndex].points ?? 0;

  // Calculate next level points
  final int currentLevelMaxPoints;
  if (currentLevelIndex >= levelsList.length - 1) {
    currentLevelMaxPoints = currentLevelMinPoints + 100;
  } else {
    final int nextLevelPoints = levelsList[currentLevelIndex + 1].points ?? 0;
    currentLevelMaxPoints = nextLevelPoints;
  }

  // Calculate progress
  final int pointsInCurrentLevel = earnedPoints - currentLevelMinPoints;
  final int totalPointsInLevel = currentLevelMaxPoints - currentLevelMinPoints;

  // Avoid division by zero
  if (totalPointsInLevel <= 0) {
    return 1.0;
  }

  // Calculate progress within current level (0 to 1)
  final double progress = pointsInCurrentLevel / totalPointsInLevel;

  // Ensure progress is between 0 and 1
  return progress.clamp(0.0, 1.0);
}

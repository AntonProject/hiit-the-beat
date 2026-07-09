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

bool newLevelAchieved(
  List<WorkoutStatisticStruct>? currentProgress,
  WorkoutStatisticStruct? newProgress,
  List<UserLevelStruct> levelsList,
) {
  // Handle null or empty currentProgress
  if (currentProgress == null) {
    currentProgress = [];
  }

  // Handle null newProgress
  if (newProgress == null) {
    return false;
  }

  // Calculate current total points
  final currentTotalPoints = currentProgress.fold(0, (sum, workout) {
    final workoutPoints = workout.workoutPoints ?? 0;
    final warpmupPoints = workout.warpmupPoints ?? 0;
    final cooldownPoints = workout.cooldownPoints ?? 0;
    return sum + workoutPoints + warpmupPoints + cooldownPoints;
  });

  // Calculate points from new progress
  final newWorkoutPoints = newProgress.workoutPoints ?? 0;
  final newWarpmupPoints = newProgress.warpmupPoints ?? 0;
  final newCooldownPoints = newProgress.cooldownPoints ?? 0;
  final newPoints = newWorkoutPoints + newWarpmupPoints + newCooldownPoints;

  // Calculate new total points
  final newTotalPoints = currentTotalPoints + newPoints;

  // Find current level based on current total points
  int currentLevelIndex = 0;
  for (int i = levelsList.length - 1; i >= 0; i--) {
    if (currentTotalPoints >= levelsList[i].points) {
      currentLevelIndex = i;
      break;
    }
  }

  // Find new level based on new total points
  int newLevelIndex = 0;
  for (int i = levelsList.length - 1; i >= 0; i--) {
    if (newTotalPoints >= levelsList[i].points) {
      newLevelIndex = i;
      break;
    }
  }

  // Return true if user achieved a new level
  return newLevelIndex > currentLevelIndex;
}

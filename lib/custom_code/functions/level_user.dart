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

UserLevelStruct levelUser(
  int totalPoints,
  List<UserLevelStruct> levelsList,
) {
  // Find current level based on user's total points
  int currentLevelIndex = 0;

  // Iterate through levels to find the highest level the user qualifies for
  for (int i = levelsList.length - 1; i >= 0; i--) {
    if (totalPoints >= levelsList[i].points) {
      currentLevelIndex = i;
      break;
    }
  }

  // Return the user's current level
  return levelsList[currentLevelIndex];
}

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

int nextSeasonInListSeasons(
  DocumentReference? season,
  List<DocumentReference>? seasonsList,
) {
  // Default index if not found
  int defaultIndex = 0;

  // Check if parameters are null or empty
  if (season == null) {
    return defaultIndex;
  }

  if (seasonsList == null || seasonsList.isEmpty) {
    return defaultIndex;
  }

  // Try to find the index of the season in the list
  for (int i = 0; i < seasonsList.length; i++) {
    // Compare document paths to see if they're the same reference
    if (seasonsList[i].path == season.path) {
      // Found the current season
      // Calculate next index with boundary check
      int nextIndex = i + 1;

      // If next index would be out of bounds, return the last valid index
      if (nextIndex >= seasonsList.length) {
        return seasonsList.length - 1;
      }

      return nextIndex;
    }
  }

  // If current season not found, return the default index
  return defaultIndex;
}

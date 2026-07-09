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

List<SeasonsRecord>? seasonsNotDone(
  int level,
  List<SeasonsRecord>? seasons,
  List<SeasonStatisticStruct>? seasonDone,
  List<WorkoutStatisticStruct>? workoutDone,
) {
  if (seasons == null || seasons.isEmpty) {
    return null;
  }
  final actualLevel = (level == null || level == 0) ? 1 : level;
  // Filter by level first
  var levelFiltered =
      seasons.where((season) => season.level == actualLevel).toList();
  if (levelFiltered.isEmpty) {
    return null;
  }

  if ((seasonDone == null || seasonDone.isEmpty) &&
      (workoutDone == null || workoutDone.isEmpty)) {
    return levelFiltered;
  }

  final completedSeasonIds =
      seasonDone?.map((stat) => stat.seasonId).toSet() ?? {};

  final startedSeasonIds =
      workoutDone?.map((workout) => workout.seasonId).toSet() ?? {};

  final allTouchedSeasonIds = {...completedSeasonIds, ...startedSeasonIds};

  levelFiltered = levelFiltered
      .where((season) => !allTouchedSeasonIds.contains(season.reference.id))
      .toList();

  return levelFiltered;
}

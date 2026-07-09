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

List<SeasonsRecord>? filterSeasons(
  int level,
  String filterAppstate,
  List<SeasonsRecord>? seasons,
  bool hideCompeted,
  List<SeasonStatisticStruct>? seasonDone,
) {
  if (seasons == null || seasons.isEmpty) {
    return null;
  }
  // Filter by level first
  var levelFiltered = seasons.where((season) => season.level == level).toList();
  if (levelFiltered.isEmpty) {
    return null;
  }

  if (hideCompeted && seasonDone != null && seasonDone.isNotEmpty) {
    final completedSeasonIds = seasonDone.map((stat) => stat.seasonId).toSet();

    levelFiltered = levelFiltered
        .where((season) => !completedSeasonIds.contains(season.reference.id))
        .toList();

    if (levelFiltered.isEmpty) {
      return null;
    }
  }
  // Then filter by language
  switch (filterAppstate.toLowerCase()) {
    case 'en':
      // Only EN: en == true AND de == false
      final filtered = levelFiltered
          .where((season) => season.en == true && season.de == false)
          .toList();
      return filtered.isEmpty ? null : filtered;

    case 'de':
      // Only DE: de == true AND en == false
      final filtered = levelFiltered
          .where((season) => season.de == true && season.en == false)
          .toList();
      return filtered.isEmpty ? null : filtered;

    case 'all':
      // Return all seasons without language filtering
      return levelFiltered;

    default:
      return levelFiltered;
  }
}

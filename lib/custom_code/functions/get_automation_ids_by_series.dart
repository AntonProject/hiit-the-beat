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

List<String> getAutomationIdsBySeries(
  List<int> automationSeries,
  dynamic inputData,
) {
  final contactAutomations = inputData['contactAutomations'] as List<dynamic>?;
  if (contactAutomations == null) return [];

  return contactAutomations
      .where((ca) {
        final seriesId = (ca as Map)['seriesid']?.toString();
        if (seriesId == null) return false;
        final parsedId = int.tryParse(seriesId);
        return parsedId != null && automationSeries.contains(parsedId);
      })
      .map<String>((ca) => (ca as Map)['id'].toString())
      .toList();
}

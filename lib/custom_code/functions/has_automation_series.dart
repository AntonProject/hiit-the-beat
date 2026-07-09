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

bool hasAutomationSeries(
  dynamic contactAutomations,
  String targetSeriesId,
) {
  var debug = true;
  if (debug) print('Checking for seriesId: "$targetSeriesId"');

  // Check if the data contains contactAutomations
  if (contactAutomations.containsKey('contactAutomations') &&
      contactAutomations['contactAutomations'] is List &&
      (contactAutomations['contactAutomations'] as List).isNotEmpty) {
    if (debug)
      print(
          'Found ${(contactAutomations['contactAutomations'] as List).length} automations');

    // Loop through each automation
    for (var automation in contactAutomations['contactAutomations']) {
      // Check if the current automation has the target seriesId
      if (automation is Map<String, dynamic> &&
          automation.containsKey('seriesid')) {
        if (debug)
          print(
              'Checking automation with seriesId: "${automation['seriesid']}"');

        if (automation['seriesid'] == targetSeriesId) {
          if (debug) print('Found matching seriesId: "$targetSeriesId"');
          return true;
        }
      }
    }

    if (debug) print('No matching seriesId found');
  } else if (debug) {
    print('No valid contactAutomations array found');
  }

  return false;
}

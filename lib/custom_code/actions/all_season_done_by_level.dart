// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> allSeasonDoneByLevel(
  int level,
  List<SeasonStatisticStruct>? seasonDone,
  String filterAppstate,
  bool hideCompleted,
) async {
  // Add your function code here!
  // If no completed seasons, return false immediately
  if (seasonDone == null || seasonDone.isEmpty) {
    return false;
  }

  // Get all season IDs that the user has completed
  final completedSeasonIds = seasonDone.map((stat) => stat.seasonId).toSet();

  // Build query to get all seasons for the given level with filters
  Query query = FirebaseFirestore.instance
      .collection('seasons')
      .where('level', isEqualTo: level);

  // Apply language filter
  switch (filterAppstate.toLowerCase()) {
    case 'en':
      query = query.where('en', isEqualTo: true);
      break;
    case 'de':
      query = query.where('de', isEqualTo: true);
      break;
    case 'all':
      // No additional filter needed - show all seasons
      break;
  }

  // Execute the query
  final querySnapshot = await query.get();

  // If no seasons found with the filters, return false
  if (querySnapshot.docs.isEmpty) {
    return false;
  }

  // Get all season IDs that match the level and filters
  final requiredSeasonIds = querySnapshot.docs.map((doc) => doc.id).toSet();

  // If hideCompleted is false, we just check if all required seasons are completed
  if (!hideCompleted) {
    // Check if all required seasons are in the completed list
    return requiredSeasonIds.every((id) => completedSeasonIds.contains(id));
  } else {
    // If hideCompleted is true, the logic changes a bit:
    // If all seasons are already completed, this function should return true
    // since there are no incomplete seasons left
    return requiredSeasonIds.every((id) => completedSeasonIds.contains(id));
  }
}

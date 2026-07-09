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

Future<SeasonsRecord> seasonIdNext(
  List<WorkoutStatisticStruct>? workoutDone,
  int level,
  String filterAppstate,
  bool hideCompeted,
  List<SeasonStatisticStruct>? seasonDone,
) async {
  // Add your function code here!
  // Variable to store current season document
  DocumentSnapshot? currentSeasonDoc;
  int currentSeasonNumber = 0;

  // Check if workoutDone is empty or null
  if (workoutDone == null || workoutDone.isEmpty) {
    // If no workouts done, get the first season sorted by number field, with filters applied
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

    final querySnapshot =
        await query.orderBy('number', descending: false).limit(1).get();

    if (querySnapshot.docs.isEmpty) {
      // No seasons found with the filters, try getting any season with the level
      final fallbackQuery = await FirebaseFirestore.instance
          .collection('seasons')
          .where('level', isEqualTo: level)
          .orderBy('number', descending: false)
          .limit(1)
          .get();

      if (fallbackQuery.docs.isEmpty) {
        throw Exception('No seasons found with the specified level');
      }

      currentSeasonDoc = fallbackQuery.docs.first;
      final data = currentSeasonDoc.data() as Map<String, dynamic>?;
      currentSeasonNumber = data?['number'] as int? ?? 0;
    } else {
      currentSeasonDoc = querySnapshot.docs.first;
      final data = currentSeasonDoc.data() as Map<String, dynamic>?;
      currentSeasonNumber = data?['number'] as int? ?? 0;
    }
  } else {
    // Get the latest workout's seasonId
    Set<String> seasonIds = {};
    DateTime latestDateTime = DateTime(1970); // Starting with a very old date
    String latestSeasonId = '';

    // Find all seasonIds and determine the latest workout date
    for (var workout in workoutDone) {
      final seasonId = workout.seasonId;
      if (seasonId != null && seasonId.isNotEmpty) {
        seasonIds.add(seasonId);

        // Check if this workout has a datetime and if it's the latest
        if (workout.datetime != null &&
            workout.datetime!.isAfter(latestDateTime)) {
          latestDateTime = workout.datetime!;
          latestSeasonId = seasonId;
        }
      }
    }

    // If we found a seasonId from the latest workout
    if (latestSeasonId.isNotEmpty) {
      try {
        // Get the season document with the latest seasonId
        final docSnapshot = await FirebaseFirestore.instance
            .collection('seasons')
            .doc(latestSeasonId)
            .get();

        if (docSnapshot.exists) {
          currentSeasonDoc = docSnapshot;
          final data = docSnapshot.data() as Map<String, dynamic>?;
          currentSeasonNumber = data?['number'] as int? ?? 0;
        }
      } catch (e) {
        print('Error fetching season document: $e');
        // Continue to fallback if there's an error
      }
    }

    // Fallback if we couldn't get the current season
    if (currentSeasonDoc == null) {
      // Get first season with filters applied
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

      final querySnapshot =
          await query.orderBy('number', descending: false).limit(1).get();

      if (querySnapshot.docs.isEmpty) {
        // Try getting any season with the level
        final fallbackQuery = await FirebaseFirestore.instance
            .collection('seasons')
            .where('level', isEqualTo: level)
            .orderBy('number', descending: false)
            .limit(1)
            .get();

        if (fallbackQuery.docs.isEmpty) {
          throw Exception('No seasons found with the specified level');
        }

        currentSeasonDoc = fallbackQuery.docs.first;
        final data = currentSeasonDoc.data() as Map<String, dynamic>?;
        currentSeasonNumber = data?['number'] as int? ?? 0;
      } else {
        currentSeasonDoc = querySnapshot.docs.first;
        final data = currentSeasonDoc.data() as Map<String, dynamic>?;
        currentSeasonNumber = data?['number'] as int? ?? 0;
      }
    }
  }

  // Now, try to find the next season (with number = currentSeasonNumber + 1)
  final nextSeasonNumber = currentSeasonNumber + 1;

  // Build query for the next season with the same filters
  Query nextSeasonQuery = FirebaseFirestore.instance
      .collection('seasons')
      .where('level', isEqualTo: level)
      .where('number', isEqualTo: nextSeasonNumber);

  // Apply language filter
  switch (filterAppstate.toLowerCase()) {
    case 'en':
      nextSeasonQuery = nextSeasonQuery.where('en', isEqualTo: true);
      break;
    case 'de':
      nextSeasonQuery = nextSeasonQuery.where('de', isEqualTo: true);
      break;
    case 'all':
      // No additional filter needed - show all seasons
      break;
  }

  final nextSeasonQuerySnapshot = await nextSeasonQuery.limit(1).get();

  // Check if next season exists and apply the hideCompleted filter
  if (nextSeasonQuerySnapshot.docs.isNotEmpty) {
    final nextSeasonDoc = nextSeasonQuerySnapshot.docs.first;

    // If hideCompeted is true, check if the season is already completed
    if (hideCompeted && seasonDone != null && seasonDone.isNotEmpty) {
      final completedSeasonIds =
          seasonDone.map((stat) => stat.seasonId).toSet();

      // If next season is already completed
      if (completedSeasonIds.contains(nextSeasonDoc.id)) {
        // Try to find the next non-completed season
        Query furtherSeasonQuery = FirebaseFirestore.instance
            .collection('seasons')
            .where('level', isEqualTo: level)
            .where('number', isGreaterThan: nextSeasonNumber);

        // Apply language filter
        switch (filterAppstate.toLowerCase()) {
          case 'en':
            furtherSeasonQuery =
                furtherSeasonQuery.where('en', isEqualTo: true);
            break;
          case 'de':
            furtherSeasonQuery =
                furtherSeasonQuery.where('de', isEqualTo: true);
            break;
          case 'all':
            // No additional filter needed - show all seasons
            break;
        }

        furtherSeasonQuery =
            furtherSeasonQuery.orderBy('number', descending: false);

        final furtherSeasonQuerySnapshot = await furtherSeasonQuery.get();

        // Filter out completed seasons
        for (var doc in furtherSeasonQuerySnapshot.docs) {
          if (!completedSeasonIds.contains(doc.id)) {
            return SeasonsRecord.fromSnapshot(doc);
          }
        }

        // If all seasons are completed or none found, return the current season
        return SeasonsRecord.fromSnapshot(currentSeasonDoc!);
      }
    }

    // Return the next season if it's not completed or hideCompeted is false
    return SeasonsRecord.fromSnapshot(nextSeasonDoc);
  }

  // If next season doesn't exist with the same filters, try without language filter
  if (filterAppstate.toLowerCase() == 'en' ||
      filterAppstate.toLowerCase() == 'de' ||
      filterAppstate.toLowerCase() == 'all') {
    final nextSeasonWithoutLanguageFilter = await FirebaseFirestore.instance
        .collection('seasons')
        .where('level', isEqualTo: level)
        .where('number', isEqualTo: nextSeasonNumber)
        .limit(1)
        .get();

    if (nextSeasonWithoutLanguageFilter.docs.isNotEmpty) {
      final nextSeasonDoc = nextSeasonWithoutLanguageFilter.docs.first;

      // Apply hideCompleted filter if needed
      if (hideCompeted && seasonDone != null && seasonDone.isNotEmpty) {
        final completedSeasonIds =
            seasonDone.map((stat) => stat.seasonId).toSet();
        if (!completedSeasonIds.contains(nextSeasonDoc.id)) {
          return SeasonsRecord.fromSnapshot(nextSeasonDoc);
        }
      } else {
        return SeasonsRecord.fromSnapshot(nextSeasonDoc);
      }
    }
  }

  // If next season doesn't exist at all, return the current season as fallback
  return SeasonsRecord.fromSnapshot(currentSeasonDoc!);
}

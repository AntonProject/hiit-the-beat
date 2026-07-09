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

Future<SeasonsRecord> season1(String currentLanguage) async {
  // Add your function code here!

  // Build query to find the first season for the specified language
  Query query = FirebaseFirestore.instance.collection('seasons');

  // Apply language filter based on the current language
  switch (currentLanguage.toLowerCase()) {
    case 'en':
      query = query.where('en', isEqualTo: true);
      break;
    case 'de':
      query = query.where('de', isEqualTo: true);
      break;
    case 'ja':
      query = query.where('ja', isEqualTo: true);
      break;
    default:
      // If language is not recognized, default to English
      query = query.where('en', isEqualTo: true);
      break;
  }

  // Sort by number to get the first season and limit to 1 result
  final querySnapshot =
      await query.orderBy('number', descending: false).limit(1).get();

  // Check if any season was found with the specified language
  if (querySnapshot.docs.isNotEmpty) {
    return SeasonsRecord.fromSnapshot(querySnapshot.docs.first);
  }

  // If no season found with the specified language, try other languages
  print(
      'No season found for language: $currentLanguage, trying fallback options...');

  // Try English if we weren't already looking for English
  if (currentLanguage.toLowerCase() != 'en') {
    final englishQuery = await FirebaseFirestore.instance
        .collection('seasons')
        .where('en', isEqualTo: true)
        .orderBy('number', descending: false)
        .limit(1)
        .get();

    if (englishQuery.docs.isNotEmpty) {
      print('Found English season as fallback');
      return SeasonsRecord.fromSnapshot(englishQuery.docs.first);
    }
  }

  // Try German if we weren't already looking for German
  if (currentLanguage.toLowerCase() != 'de') {
    final germanQuery = await FirebaseFirestore.instance
        .collection('seasons')
        .where('de', isEqualTo: true)
        .orderBy('number', descending: false)
        .limit(1)
        .get();

    if (germanQuery.docs.isNotEmpty) {
      print('Found German season as fallback');
      return SeasonsRecord.fromSnapshot(germanQuery.docs.first);
    }
  }

  // Try Japanese if we weren't already looking for Japanese
  if (currentLanguage.toLowerCase() != 'ja') {
    final japaneseQuery = await FirebaseFirestore.instance
        .collection('seasons')
        .where('ja', isEqualTo: true)
        .orderBy('number', descending: false)
        .limit(1)
        .get();

    if (japaneseQuery.docs.isNotEmpty) {
      print('Found Japanese season as fallback');
      return SeasonsRecord.fromSnapshot(japaneseQuery.docs.first);
    }
  }

  // If still no season found with any language filter, get any first season available
  print(
      'No season found with any language filter, getting any available season...');
  final anySeasonQuery = await FirebaseFirestore.instance
      .collection('seasons')
      .orderBy('number', descending: false)
      .limit(1)
      .get();

  if (anySeasonQuery.docs.isEmpty) {
    throw Exception('No seasons found in the database at all');
  }

  print('Found season without language filter as final fallback');
  return SeasonsRecord.fromSnapshot(anySeasonQuery.docs.first);
}

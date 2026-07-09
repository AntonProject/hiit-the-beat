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

List<UserLevelStruct> levels() {
  // Define the levels data structure with corresponding points thresholds
  final levelData = [
    {"levelNumber": 1, "levelName": "Newbie", "points": 0},
    {"levelNumber": 2, "levelName": "Chunky Monkey", "points": 30},
    {"levelNumber": 3, "levelName": "Biceps Bunny", "points": 65},
    {"levelNumber": 4, "levelName": "Rookie", "points": 110},
    {"levelNumber": 5, "levelName": "Hangry Bird", "points": 160},
    {"levelNumber": 6, "levelName": "Road Runner", "points": 220},
    {"levelNumber": 7, "levelName": "Hobby Athlete", "points": 290},
    {"levelNumber": 8, "levelName": "Lightweight Baby", "points": 370},
    {"levelNumber": 9, "levelName": "Pound Dropper", "points": 460},
    {"levelNumber": 10, "levelName": "Challenger", "points": 560},
    {"levelNumber": 11, "levelName": "Footworker", "points": 670},
    {"levelNumber": 12, "levelName": "Gym Class Hero", "points": 790},
    {"levelNumber": 13, "levelName": "Playmaker", "points": 920},
    {"levelNumber": 14, "levelName": "Babyfreeze Master", "points": 1060},
    {"levelNumber": 15, "levelName": "Beatkiller", "points": 1210},
    {"levelNumber": 16, "levelName": "Workout Wonder", "points": 1370},
    {"levelNumber": 17, "levelName": "Beast Booty", "points": 1540},
    {"levelNumber": 18, "levelName": "Sixpack Analyst", "points": 1720},
    {"levelNumber": 19, "levelName": "Explosive Mover", "points": 1910},
    {"levelNumber": 20, "levelName": "Workout Hunter", "points": 2110},
    {"levelNumber": 21, "levelName": "Gamechanger", "points": 2320},
    {"levelNumber": 22, "levelName": "King of Pushups", "points": 2540},
    {"levelNumber": 23, "levelName": "Vegeta", "points": 2770},
    {"levelNumber": 24, "levelName": "Core Dominator", "points": 3010},
    {"levelNumber": 25, "levelName": "Sweat Samurai", "points": 3260},
    {"levelNumber": 26, "levelName": "Cardio Crusher", "points": 3520},
    {"levelNumber": 27, "levelName": "Mobility Master", "points": 3790},
    {"levelNumber": 28, "levelName": "Form Freak", "points": 4070},
    {"levelNumber": 29, "levelName": "Power Panther", "points": 4360},
    {"levelNumber": 30, "levelName": "Iron Chest", "points": 4660},
    {"levelNumber": 31, "levelName": "Beastmode Rookie", "points": 4970},
    {"levelNumber": 32, "levelName": "Flexecutioner", "points": 5290},
    {"levelNumber": 33, "levelName": "Agility Ace", "points": 5620},
    {"levelNumber": 34, "levelName": "Bodyweight Champion", "points": 5960},
    {"levelNumber": 35, "levelName": "Pushup Prince", "points": 6310},
    {"levelNumber": 36, "levelName": "Rhythm Rebel", "points": 6670},
    {"levelNumber": 37, "levelName": "Plank Pirate", "points": 7040},
    {"levelNumber": 38, "levelName": "Jumping Juggernaut", "points": 7420},
    {"levelNumber": 39, "levelName": "Iron Dancer", "points": 7810},
    {"levelNumber": 40, "levelName": "Explosive Panther", "points": 8210},
    {"levelNumber": 41, "levelName": "Beast Beyond", "points": 8520},
    {"levelNumber": 42, "levelName": "Core Commander", "points": 8840},
    {"levelNumber": 43, "levelName": "Sprint Cyclone", "points": 9070},
    {"levelNumber": 44, "levelName": "Gravity Bender", "points": 9310},
    {"levelNumber": 45, "levelName": "Battle Beast", "points": 9560},
    {"levelNumber": 46, "levelName": "The Transformer", "points": 9720},
    {"levelNumber": 47, "levelName": "HIIT Legend", "points": 9890},
    {"levelNumber": 48, "levelName": "Push Warrior", "points": 10070},
    {"levelNumber": 49, "levelName": "Rage Releaser", "points": 10260},
    {"levelNumber": 50, "levelName": "King of Gods", "points": 10500},
  ];

  // Convert raw data to UserLevelStruct objects
  List<UserLevelStruct> userLevels = [];
  for (var level in levelData) {
    userLevels.add(UserLevelStruct(
      levelNumber: level["levelNumber"] as int,
      levenName: level["levelName"] as String,
      points: level["points"] as int,
    ));
  }

  return userLevels;
}

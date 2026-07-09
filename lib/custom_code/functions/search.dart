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

bool search(
  String searchText,
  String? text1,
  String? text2,
  String? text3,
  String? text4,
  String? text5,
) {
  return text1!.toLowerCase().contains(searchText.toLowerCase()) ||
      text2!.toLowerCase().contains(searchText.toLowerCase()) ||
      text3!.toLowerCase().contains(searchText.toLowerCase()) ||
      text4!.toLowerCase().contains(searchText.toLowerCase()) ||
      text5!.toLowerCase().contains(searchText.toLowerCase());
}

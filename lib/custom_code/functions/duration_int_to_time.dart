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

String? durationIntToTime(
  int duration,
  String language,
) {
  try {
    final Map<String, String> labels = {
      'minute': language == 'de' ? 'min' : (language == 'ja' ? '分' : 'min'),
      'minutes': language == 'de' ? 'min' : (language == 'ja' ? '分' : 'min'),
      'hour': language == 'de' ? 'Stunde' : (language == 'ja' ? '時間' : 'hour'),
      'hours':
          language == 'de' ? 'Stunden' : (language == 'ja' ? '時間' : 'hours'),
      'day': language == 'de' ? 'Tag' : (language == 'ja' ? '日' : 'day'),
      'days': language == 'de' ? 'Tage' : (language == 'ja' ? '日' : 'days'),
      'week': language == 'de' ? 'Woche' : (language == 'ja' ? '週間' : 'week'),
      'weeks':
          language == 'de' ? 'Wochen' : (language == 'ja' ? '週間' : 'weeks'),
    };

    double minutes = duration / (1000 * 60);
    double hours = minutes / 60;
    double days = hours / 24;
    double weeks = days / 7;

    if (weeks >= 1) {
      if (days % 7 >= 5) {
        int weekCount = (weeks + 1).floor();
        String label = weekCount == 1 ? labels['week']! : labels['weeks']!;

        return language == 'ja' ? '$weekCount$label' : '$weekCount $label';
      } else {
        int weekCount = weeks.floor();
        String label = weekCount == 1 ? labels['week']! : labels['weeks']!;
        return language == 'ja' ? '$weekCount$label' : '$weekCount $label';
      }
    }
    if (days >= 1) {
      if (hours % 24 >= 12) {
        int dayCount = (days + 1).floor();
        String label = dayCount == 1 ? labels['day']! : labels['days']!;
        return language == 'ja' ? '$dayCount$label' : '$dayCount $label';
      } else {
        int dayCount = days.floor();
        String label = dayCount == 1 ? labels['day']! : labels['days']!;
        return language == 'ja' ? '$dayCount$label' : '$dayCount $label';
      }
    }
    if (hours >= 1) {
      if (minutes % 60 >= 30) {
        int hourCount = (hours + 1).floor();
        String label = hourCount == 1 ? labels['hour']! : labels['hours']!;
        return language == 'ja' ? '$hourCount$label' : '$hourCount $label';
      } else {
        int hourCount = hours.floor();
        String label = hourCount == 1 ? labels['hour']! : labels['hours']!;
        return language == 'ja' ? '$hourCount$label' : '$hourCount $label';
      }
    }
    // Для минут
    int minuteCount = (minutes + 0.5).ceil();
    String minuteLabel = language == 'ja' ? '分' : 'min';
    return language == 'ja'
        ? '$minuteCount$minuteLabel'
        : '$minuteCount $minuteLabel';
  } catch (e) {
    return null;
  }
}

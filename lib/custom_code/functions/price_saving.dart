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

String priceSaving(
  String yearPrice,
  String monthPrice,
  String? period,
) {
  String cleanNumber(String price) {
    String cleaned = price.replaceAll(RegExp(r'[^\d.,]'), '');

    int commaIndex = cleaned.lastIndexOf(',');

    int dotIndex = cleaned.lastIndexOf('.');

    if (commaIndex != -1 && dotIndex != -1) {
      if (commaIndex > dotIndex) {
        cleaned = cleaned.replaceAll('.', '').replaceAll(',', '.');
      } else {
        cleaned = cleaned.replaceAll(',', '');
      }
    } else if (commaIndex != -1) {
      cleaned = cleaned.replaceAll(',', '.');
    }

    return cleaned;
  }

  String yearNumStr = cleanNumber(yearPrice);

  String monthNumStr = cleanNumber(monthPrice);

  double? yearValue = double.tryParse(yearNumStr);

  double? monthValue = double.tryParse(monthNumStr);

  if (yearNumStr.isEmpty ||
      monthNumStr.isEmpty ||
      yearValue == null ||
      monthValue == null ||
      yearValue == 0 ||
      monthValue == 0) {
    return '';
  }

  String currency = yearPrice.replaceAll(RegExp(r'[\d\s.,]'), '').trim();

  currency =
      (currency.contains('₽') || currency.contains('RUB')) ? 'RUB' : currency;

  bool currencyAtStart = yearPrice.trimLeft().startsWith(RegExp(r'[^\d\s]'));

  String sep = currency.length <= 1 ? '' : ' ';

  double value;

  if (period == 'week') {
    value = yearValue / 52;
  } else {
    value = (monthValue * 12) - yearValue;
  }

  if (value <= 0) {
    return currencyAtStart ? '$currency${sep}0' : '0$sep$currency';
  }

  String formatted = NumberFormat("#,##0").format(value.round());

  String result =
      currencyAtStart ? '$currency$sep$formatted' : '$formatted$sep$currency';

  return result.contains('RUB') ? result : result.replaceAll('₽', 'RUB');
}

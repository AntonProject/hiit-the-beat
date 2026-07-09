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

String pricePeriod(
  String price,
  int period,
  String monthPrice,
  bool increase,
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

  String formatResult(
    String currency,
    bool currencyAtStart,
    String value,
    String sep,
  ) {
    final result =
        currencyAtStart ? '$currency$sep$value' : '$value$sep$currency';

    return result.contains('RUB') ? result.replaceAll('₽', 'RUB') : result;
  }

  String currency = price.replaceAll(RegExp(r'[\d\s.,]'), '').trim();

  currency =
      (currency.contains('₽') || currency.contains('RUB')) ? 'RUB' : currency;

  bool currencyAtStart = price.trimLeft().startsWith(RegExp(r'[^\d\s]'));

  String sep = currency.length <= 1 ? '' : ' ';

  String priceNumStr = cleanNumber(price);

  String monthPriceNumStr = cleanNumber(monthPrice);

  double? priceValue = double.tryParse(priceNumStr);

  double? monthPriceValue = double.tryParse(monthPriceNumStr);

  if (priceNumStr.isEmpty || priceValue == null || priceValue == 0) {
    return formatResult(
      currency,
      currencyAtStart,
      cleanNumber(price),
      sep,
    );
  }

  // ───────── CASE: no month price ─────────

  if (monthPrice == "0") {
    double value;

    if (period == 1) {
      return formatResult(
        currency,
        currencyAtStart,
        cleanNumber(price),
        sep,
      );
    }

    value = increase ? priceValue * period : priceValue / period;

    String formatted = value % 1 == 0
        ? NumberFormat("#,##0").format(value)
        : NumberFormat("#,##0.00").format(value);

    return formatResult(currency, currencyAtStart, formatted, sep);
  }

  // ───────── CASE: savings calculation ─────────

  double? monthValue = monthPriceValue;

  if (monthValue == null || monthValue == 0) {
    return formatResult(
      currency,
      currencyAtStart,
      cleanNumber(price),
      sep,
    );
  }

  double savings = (monthValue * period) - priceValue;

  if (savings <= 0) {
    return formatResult(currency, currencyAtStart, '0', sep);
  }

  String formattedSavings = savings % 1 == 0
      ? NumberFormat("#,##0").format(savings)
      : NumberFormat("#,##0.00").format(savings);

  return formatResult(currency, currencyAtStart, formattedSavings, sep);
}

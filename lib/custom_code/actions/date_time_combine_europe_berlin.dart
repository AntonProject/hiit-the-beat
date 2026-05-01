// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// Combines optional picker date/time with an optional stored instant.
///
/// Rules:
/// - If BOTH pickers are null AND [stored] is non-null: returns [stored] normalized to UTC
///   WITHOUT re-labeling components as Berlin (safe for "no schedule change" updates).
/// - Otherwise: treats chosen components as **Europe/Berlin wall time** and returns UTC instant.
///
/// Notes:
/// - [stored] should represent the saved Firestore instant (prefer interpreting as UTC via `.toUtc()`).
/// - This relies on you passing `null` for untouched pickers (not "doc datetime as fake picker value").
DateTime dateTimeCombineEuropeBerlin(
  DateTime? pickedDate,
  DateTime? pickedTime,
  DateTime? stored,
) {
  // Lazy init fallback (prefer initializing in main()).
  try {
    tz.getLocation('Europe/Berlin');
  } catch (_) {
    tz_data.initializeTimeZones();
  }

  final location = tz.getLocation('Europe/Berlin');
  final nowBerlin = tz.TZDateTime.now(location);

  // No picker input at all: keep existing value OR "now" in Berlin if creating without schedule.
  if (pickedDate == null && pickedTime == null) {
    if (stored != null) {
      return stored.toUtc();
    }
    return nowBerlin.toUtc();
  }

  tz.TZDateTime? storedBerlin;
  if (stored != null) {
    storedBerlin = tz.TZDateTime.from(stored.toUtc(), location);
  }

  final int year;
  final int month;
  final int day;

  if (pickedDate != null) {
    year = pickedDate.year;
    month = pickedDate.month;
    day = pickedDate.day;
  } else if (storedBerlin != null) {
    year = storedBerlin.year;
    month = storedBerlin.month;
    day = storedBerlin.day;
  } else {
    year = nowBerlin.year;
    month = nowBerlin.month;
    day = nowBerlin.day;
  }

  final int hour;
  final int minute;
  final int second;
  final int millisecond;
  final int microsecond;

  if (pickedTime != null) {
    hour = pickedTime.hour;
    minute = pickedTime.minute;
    second = pickedTime.second;
    millisecond = pickedTime.millisecond;
    microsecond = pickedTime.microsecond;
  } else if (storedBerlin != null) {
    hour = storedBerlin.hour;
    minute = storedBerlin.minute;
    second = storedBerlin.second;
    millisecond = storedBerlin.millisecond;
    microsecond = storedBerlin.microsecond;
  } else {
    hour = nowBerlin.hour;
    minute = nowBerlin.minute;
    second = nowBerlin.second;
    millisecond = nowBerlin.millisecond;
    microsecond = nowBerlin.microsecond;
  }

  final wallBerlin = tz.TZDateTime(
    location,
    year,
    month,
    day,
    hour,
    minute,
    second,
    millisecond,
    microsecond,
  );

  return wallBerlin.toUtc();
}

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

import 'dart:ui' show PlatformDispatcher;

Future<String> getUserDeviceLanguage() async {
  final locales = PlatformDispatcher.instance.locales;
  if (locales.isEmpty) {
    return 'en';
  }
  for (final locale in locales) {
    final code = locale.languageCode.toLowerCase();
    if (code == 'de') return 'de';
    if (code == 'ja') return 'ja';
    if (code == 'en') return 'en';
  }
  return 'en';
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

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

import 'package:flutter/services.dart';

Future setLandscapeMode() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Портрет (кнопка внизу)
    DeviceOrientation.portraitDown, // Портрет (кнопка вверху)
    DeviceOrientation.landscapeLeft, // Альбом (кнопка справа)
    DeviceOrientation.landscapeRight, // Альбом (кнопка слева)
  ]);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

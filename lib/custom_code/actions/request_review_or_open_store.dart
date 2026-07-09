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

import 'package:in_app_review/in_app_review.dart';

Future<void> requestReviewOrOpenStore() async {
  final InAppReview review = InAppReview.instance;
  try {
    // Нативный диалог-оценка ("Enjoying <App>? Tap a star…").
    // Текст и момент показа контролирует Apple/Google: в TestFlight не
    // покажется, в проде — максимум несколько раз в год.
    if (await review.isAvailable()) {
      await review.requestReview();
      return;
    }
    // Фолбэк, если нативный API недоступен (старая ОС и т.п.) — открыть стор.
    await review.openStoreListing(appStoreId: '1319882523');
  } catch (e) {
    print('Review error: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!

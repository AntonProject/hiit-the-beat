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

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> consumeInitialPushRoute() async {
  try {
    final message = await FirebaseMessaging.instance.getInitialMessage();
    final page = message?.data['initialPageName'] as String? ?? '';
    if (page.isNotEmpty) {
      FFAppState().pendingDeepLinkPage = page;
    }
  } catch (e) {
    print('consumeInitialPushRoute error: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!

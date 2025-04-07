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

import 'package:facebook_app_events/facebook_app_events.dart';

Future facebook() async {
  // Add your function code here!
  final facebookAppEvents = FacebookAppEvents();

  await facebookAppEvents.setAutoLogAppEventsEnabled(true);
  await facebookAppEvents.setAdvertiserTracking(enabled: true);
  await facebookAppEvents.logEvent(name: 'fb_mobile_activate_app');
}

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
  // Инициализация Facebook SDK для отслеживания установок приложения
  final facebookAppEvents = FacebookAppEvents();

  // Включаем автоматическое логирование событий
  await facebookAppEvents.setAutoLogAppEventsEnabled(true);

  // Включаем отслеживание для рекламы (важно для iOS 14+)
  await facebookAppEvents.setAdvertiserTracking(enabled: true);

  // Активируем приложение (отслеживание установок)
  await facebookAppEvents.logEvent(name: 'breakletics');
}

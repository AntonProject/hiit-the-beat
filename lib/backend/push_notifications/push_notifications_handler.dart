import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Color(0xFF161616),
          child: Center(
            child: Image.asset(
              'assets/images/newLogo.png',
              width: MediaQuery.sizeOf(context).width * 0.8,
              fit: BoxFit.fitWidth,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': ParameterData.none(),
  'AuthPage': ParameterData.none(),
  'LoginPage': ParameterData.none(),
  'RestorePasswordPage': ParameterData.none(),
  'SignupPage': ParameterData.none(),
  'EmailVerificationPage': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'ChangeEmailPage': ParameterData.none(),
  'EmailChangeSendLinkPage': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'PhoneEditPage': ParameterData.none(),
  'TermsPage': ParameterData.none(),
  'PolicyPage': ParameterData.none(),
  'ImprintPage': ParameterData.none(),
  'ProfilePage': ParameterData.none(),
  'PasswordChangePage': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'PasswordChangePage2': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'ProfileEditPage': ParameterData.none(),
  'StartPage': ParameterData.none(),
  'AdditionalsPage': ParameterData.none(),
  'SeasonWorkoutPage': (data) async => ParameterData(
        allParams: {
          'level': getParameter<int>(data, 'level'),
        },
      ),
  'SeasonPage': (data) async => ParameterData(
        allParams: {
          'season': await getDocumentParameter<SeasonsRecord>(
              data, 'season', SeasonsRecord.fromSnapshot),
          'workoutCount': getParameter<int>(data, 'workoutCount'),
          'seasonIndex': getParameter<int>(data, 'seasonIndex'),
          'selectedLvl': getParameter<int>(data, 'selectedLvl'),
        },
      ),
  'WorkoutPage': (data) async => ParameterData(
        allParams: {
          'season': await getDocumentParameter<SeasonsRecord>(
              data, 'season', SeasonsRecord.fromSnapshot),
          'workout': await getDocumentParameter<WorkoutsRecord>(
              data, 'workout', WorkoutsRecord.fromSnapshot),
          'workoutCount': getParameter<int>(data, 'workoutCount'),
          'indexInList': getParameter<int>(data, 'indexInList'),
          'progress': getParameter<DocumentReference>(data, 'progress'),
          'seasonIndex': getParameter<int>(data, 'seasonIndex'),
          'selectedLvl': getParameter<int>(data, 'selectedLvl'),
        },
      ),
  'AdminAuth': ParameterData.none(),
  'AdminUserManagement': ParameterData.none(),
  'AdminSettings': ParameterData.none(),
  'AdminEditPromo': (data) async => ParameterData(
        allParams: {
          'promo': await getDocumentParameter<PromoRecord>(
              data, 'promo', PromoRecord.fromSnapshot),
        },
      ),
  'AdminPromo': ParameterData.none(),
  'AdminAddPromo': ParameterData.none(),
  'AdminAdditional': ParameterData.none(),
  'AdminEditAddit': (data) async => ParameterData(
        allParams: {
          'addit': await getDocumentParameter<AdditionalsRecord>(
              data, 'addit', AdditionalsRecord.fromSnapshot),
        },
      ),
  'AdminAddAddit': (data) async => ParameterData(
        allParams: {
          'type': getParameter<int>(data, 'type'),
        },
      ),
  'AdminEditUser': (data) async => ParameterData(
        allParams: {
          'user': await getDocumentParameter<UsersRecord>(
              data, 'user', UsersRecord.fromSnapshot),
        },
      ),
  'AdminZoom': (data) async => ParameterData(
        allParams: {
          'zoom': await getDocumentParameter<AdditionalsRecord>(
              data, 'zoom', AdditionalsRecord.fromSnapshot),
          'zoom2': await getDocumentParameter<AdditionalsRecord>(
              data, 'zoom2', AdditionalsRecord.fromSnapshot),
        },
      ),
  'AdminSeasons': ParameterData.none(),
  'AdminWorkouts': (data) async => ParameterData(
        allParams: {
          'season': await getDocumentParameter<SeasonsRecord>(
              data, 'season', SeasonsRecord.fromSnapshot),
        },
      ),
  'AdminEditSeason': (data) async => ParameterData(
        allParams: {
          'season': await getDocumentParameter<SeasonsRecord>(
              data, 'season', SeasonsRecord.fromSnapshot),
        },
      ),
  'AdminAddSeason': ParameterData.none(),
  'AdminEditWorkout': (data) async => ParameterData(
        allParams: {
          'work': await getDocumentParameter<WorkoutsRecord>(
              data, 'work', WorkoutsRecord.fromSnapshot),
          'season': await getDocumentParameter<SeasonsRecord>(
              data, 'season', SeasonsRecord.fromSnapshot),
        },
      ),
  'AdminAddWorkout': (data) async => ParameterData(
        allParams: {
          'season': await getDocumentParameter<SeasonsRecord>(
              data, 'season', SeasonsRecord.fromSnapshot),
        },
      ),
  'SubscriptionPage': ParameterData.none(),
  'videoPage': (data) async => ParameterData(
        allParams: {
          'videoEn': getParameter<String>(data, 'videoEn'),
          'videoDe': getParameter<String>(data, 'videoDe'),
          'videoJa': getParameter<String>(data, 'videoJa'),
        },
      ),
  'AdminBanners': ParameterData.none(),
  'AdminAddBanner': ParameterData.none(),
  'AdminEditBanner': (data) async => ParameterData(
        allParams: {
          'banner': await getDocumentParameter<VideosRecord>(
              data, 'banner', VideosRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}

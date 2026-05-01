import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialogs/onboarding_home_step1/onboarding_home_step1_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'onboarding_home_step2_widget.dart' show OnboardingHomeStep2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardingHomeStep2Model
    extends FlutterFlowModel<OnboardingHomeStep2Widget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - season1] action in next widget.
  SeasonsRecord? season;
  // Stores action output result for [Firestore Query - Query a collection] action in next widget.
  int? count;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

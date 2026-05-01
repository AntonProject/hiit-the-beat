import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/dialogs/season_done_dialog/season_done_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'workout_success3times_dialog_widget.dart'
    show WorkoutSuccess3timesDialogWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkoutSuccess3timesDialogModel
    extends FlutterFlowModel<WorkoutSuccess3timesDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - seasonIdNext] action in Ididnthaveenough widget.
  SeasonsRecord? nextSeason;
  // Stores action output result for [Firestore Query - Query a collection] action in Ididnthaveenough widget.
  int? countNext;
  // Stores action output result for [Custom Action - workoutById] action in Ididnthaveenough widget.
  WorkoutsRecord? workDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

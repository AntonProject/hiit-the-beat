import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialogs/advanced_seasons_done_dialog/advanced_seasons_done_dialog_widget.dart';
import '/components/dialogs/beginner_seasons_done_dialog/beginner_seasons_done_dialog_widget.dart';
import '/components/dialogs/expert_seasons_done_dialog/expert_seasons_done_dialog_widget.dart';
import '/components/dialogs/gos_mode_seasons_done_dialog/gos_mode_seasons_done_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'season_done_dialog_widget.dart' show SeasonDoneDialogWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SeasonDoneDialogModel extends FlutterFlowModel<SeasonDoneDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Gotonextseason widget.
  ProgressRecord? progress;
  // Stores action output result for [Custom Action - allSeasonDoneByLevel] action in Gotonextseason widget.
  bool? allSeasonDone;
  // Stores action output result for [Custom Action - seasonIdNext] action in Gotonextseason widget.
  SeasonsRecord? nextSeason;
  // Stores action output result for [Firestore Query - Query a collection] action in Gotonextseason widget.
  int? countNext;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

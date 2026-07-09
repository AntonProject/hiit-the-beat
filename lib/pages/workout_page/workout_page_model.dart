import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/dialogs/guest_dialog/guest_dialog_widget.dart';
import '/components/dialogs/level_success_dialog/level_success_dialog_widget.dart';
import '/components/dialogs/onboarding_home_step4/onboarding_home_step4_widget.dart';
import '/components/dialogs/payment_dialog/payment_dialog_widget.dart';
import '/components/dialogs/select_warm_up_cool_down_dialog/select_warm_up_cool_down_dialog_widget.dart';
import '/components/dialogs/workout_success3times_dialog/workout_success3times_dialog_widget.dart';
import '/components/dialogs/workout_success_dialog/workout_success_dialog_widget.dart';
import '/components/skeleton/skeleton_workout/skeleton_workout_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'workout_page_widget.dart' show WorkoutPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkoutPageModel extends FlutterFlowModel<WorkoutPageWidget> {
  ///  Local state fields for this page.

  int trainingChoose = 1;

  List<int> trainingsDone = [];
  void addToTrainingsDone(int item) => trainingsDone.add(item);
  void removeFromTrainingsDone(int item) => trainingsDone.remove(item);
  void removeAtIndexFromTrainingsDone(int index) =>
      trainingsDone.removeAt(index);
  void insertAtIndexInTrainingsDone(int index, int item) =>
      trainingsDone.insert(index, item);
  void updateTrainingsDoneAtIndex(int index, Function(int) updateFn) =>
      trainingsDone[index] = updateFn(trainingsDone[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

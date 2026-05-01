import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'admin_season_delete_widget.dart' show AdminSeasonDeleteWidget;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminSeasonDeleteModel extends FlutterFlowModel<AdminSeasonDeleteWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Cloud Function - deleteWorkoutsSeason] action in Button widget.
  DeleteWorkoutsSeasonCloudFunctionCallResponse? seasonDelete;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialogs/log_out_dialog/log_out_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'admin_nav_bar_widget.dart' show AdminNavBarWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminNavBarModel extends FlutterFlowModel<AdminNavBarWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Zoomjam widget.
  AdditionalsRecord? zoomCreate;
  // Stores action output result for [Backend Call - Create Document] action in Zoomjam widget.
  AdditionalsRecord? zoomCreate2;
  // Stores action output result for [Firestore Query - Query a collection] action in Zoomjam widget.
  List<AdditionalsRecord>? queryAdditionals;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

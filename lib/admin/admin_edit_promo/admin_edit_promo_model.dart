import '/admin/admin_components/admin_nav_bar/admin_nav_bar_widget.dart';
import '/admin/admin_components/admin_save_dialog/admin_save_dialog_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'admin_edit_promo_widget.dart' show AdminEditPromoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminEditPromoModel extends FlutterFlowModel<AdminEditPromoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AdminNavBar component.
  late AdminNavBarModel adminNavBarModel;
  // State field(s) for textEn widget.
  FocusNode? textEnFocusNode;
  TextEditingController? textEnTextController;
  String? Function(BuildContext, String?)? textEnTextControllerValidator;
  // State field(s) for textDe widget.
  FocusNode? textDeFocusNode;
  TextEditingController? textDeTextController;
  String? Function(BuildContext, String?)? textDeTextControllerValidator;
  // State field(s) for textJa widget.
  FocusNode? textJaFocusNode;
  TextEditingController? textJaTextController;
  String? Function(BuildContext, String?)? textJaTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {
    adminNavBarModel = createModel(context, () => AdminNavBarModel());
  }

  @override
  void dispose() {
    adminNavBarModel.dispose();
    textEnFocusNode?.dispose();
    textEnTextController?.dispose();

    textDeFocusNode?.dispose();
    textDeTextController?.dispose();

    textJaFocusNode?.dispose();
    textJaTextController?.dispose();
  }
}

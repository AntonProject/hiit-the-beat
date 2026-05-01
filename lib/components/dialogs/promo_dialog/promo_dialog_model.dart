import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'promo_dialog_widget.dart' show PromoDialogWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PromoDialogModel extends FlutterFlowModel<PromoDialogWidget> {
  ///  Local state fields for this component.

  bool promoCheck = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Promocode widget.
  FocusNode? promocodeFocusNode;
  TextEditingController? promocodeTextController;
  String? Function(BuildContext, String?)? promocodeTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Confirm widget.
  PromoRecord? promo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    promocodeFocusNode?.dispose();
    promocodeTextController?.dispose();
  }
}

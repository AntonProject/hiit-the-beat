import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'promo_dialog_widget.dart' show PromoDialogWidget;
import 'package:flutter/material.dart';

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

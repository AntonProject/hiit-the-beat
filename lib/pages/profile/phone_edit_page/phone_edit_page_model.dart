import '/flutter_flow/flutter_flow_util.dart';
import 'phone_edit_page_widget.dart' show PhoneEditPageWidget;
import 'package:flutter/material.dart';

class PhoneEditPageModel extends FlutterFlowModel<PhoneEditPageWidget> {
  ///  Local state fields for this page.

  bool timer = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneFocusNode?.dispose();
    phoneTextController?.dispose();
  }
}

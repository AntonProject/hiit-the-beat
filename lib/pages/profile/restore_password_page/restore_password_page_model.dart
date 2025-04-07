import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'restore_password_page_widget.dart' show RestorePasswordPageWidget;
import 'package:flutter/material.dart';

class RestorePasswordPageModel
    extends FlutterFlowModel<RestorePasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'm9k8h0bc' /* Fill in the field */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'mzxyqw4w' /* Fill in the field */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        '8q6mgrph' /* Fill in the field */,
      );
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'gmrns7b0' /* Invalid format */,
      );
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}

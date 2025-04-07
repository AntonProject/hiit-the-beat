import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        's2ir1gfg' /* Wrong email or password */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'lmk31nfw' /* Min 6 symbols */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'kpmori2z' /* Max 50 symbols */,
      );
    }

    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'k6i77tfl' /* Wrong email or password */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'qlovy6lc' /* Min 6 symbols */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'nwzovgo8' /* Max 50 symbols */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}

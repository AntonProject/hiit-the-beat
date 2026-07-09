import '/auth/firebase_auth/auth_util.dart';
import '/components/dialog/dialog_widget.dart';
import '/components/dialogs/language_select_dialog/language_select_dialog_widget.dart';
import '/components/sign_up_delimiter_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for SignUpDelimiter component.
  late SignUpDelimiterModel signUpDelimiterModel;
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
    signUpDelimiterModel = createModel(context, () => SignUpDelimiterModel());
    emailTextControllerValidator = _emailTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    signUpDelimiterModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}

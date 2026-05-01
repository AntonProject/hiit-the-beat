import '/admin/admin_components/admin_nav_bar/admin_nav_bar_widget.dart';
import '/admin/admin_components/admin_save_dialog/admin_save_dialog_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/dialogs/select_goal_dialog/select_goal_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'admin_edit_user_widget.dart' show AdminEditUserWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminEditUserModel extends FlutterFlowModel<AdminEditUserWidget> {
  ///  Local state fields for this page.

  String? genderEn = 'Male';

  String? photo;

  String? genderDe = 'Männlich';

  DateTime? date;

  bool initialStateOfSubscription = false;

  String? genderJa = '男';

  String? goalEn;

  String? goalDe;

  String? goalJa;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Model for AdminNavBar component.
  late AdminNavBarModel adminNavBarModel;
  bool isDataUploading_uploadDataXz3 = false;
  FFUploadedFile uploadedLocalFile_uploadDataXz3 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataXz3 = '';

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ihzrzw6u' /* Fill in the field */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'ihrmznn5' /* Min 2 symbols */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'nxgh7h6z' /* Max 50 symbols */,
      );
    }

    return null;
  }

  // State field(s) for Switch widget.
  bool? switchValue;
  DateTime? datePicked1;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '26r6h9y9' /* Fill in the field */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        '4pnvphai' /* Min 2 symbols */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'mrakndqv' /* Max 50 symbols */,
      );
    }

    return null;
  }

  // State field(s) for Surname widget.
  FocusNode? surnameFocusNode;
  TextEditingController? surnameTextController;
  String? Function(BuildContext, String?)? surnameTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for Weightkg widget.
  FocusNode? weightkgFocusNode;
  TextEditingController? weightkgTextController;
  String? Function(BuildContext, String?)? weightkgTextControllerValidator;
  // State field(s) for Heightcm widget.
  FocusNode? heightcmFocusNode;
  TextEditingController? heightcmTextController;
  String? Function(BuildContext, String?)? heightcmTextControllerValidator;

  @override
  void initState(BuildContext context) {
    adminNavBarModel = createModel(context, () => AdminNavBarModel());
    emailTextControllerValidator = _emailTextControllerValidator;
    nameTextControllerValidator = _nameTextControllerValidator;
  }

  @override
  void dispose() {
    adminNavBarModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    surnameFocusNode?.dispose();
    surnameTextController?.dispose();

    weightkgFocusNode?.dispose();
    weightkgTextController?.dispose();

    heightcmFocusNode?.dispose();
    heightcmTextController?.dispose();
  }
}

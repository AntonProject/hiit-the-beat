import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/dialogs/delete_acc_dialog/delete_acc_dialog_widget.dart';
import '/components/dialogs/select_goal_dialog/select_goal_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'profile_edit_page_widget.dart' show ProfileEditPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileEditPageModel extends FlutterFlowModel<ProfileEditPageWidget> {
  ///  Local state fields for this page.

  String? photo;

  String? genderEn = 'Male';

  bool photoCheck = false;

  String? genderDe = 'Männlich';

  String? genderJa = '男';

  String? goalDe;

  String? goalEn;

  String? goalJa;

  DateTime? date;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadDataXz31 = false;
  FFUploadedFile uploadedLocalFile_uploadDataXz31 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataXz31 = '';

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'iucaudhi' /* Fill in the field */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'z32b285m' /* Min 2 symbols */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'go07m07e' /* Max 50 symbols */,
      );
    }

    return null;
  }

  // State field(s) for Surname widget.
  FocusNode? surnameFocusNode;
  TextEditingController? surnameTextController;
  String? Function(BuildContext, String?)? surnameTextControllerValidator;
  DateTime? datePicked;
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
    nameTextControllerValidator = _nameTextControllerValidator;
  }

  @override
  void dispose() {
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

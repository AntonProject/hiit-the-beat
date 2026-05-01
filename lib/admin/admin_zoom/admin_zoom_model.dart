import '/admin/admin_components/admin_nav_bar/admin_nav_bar_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'admin_zoom_widget.dart' show AdminZoomWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
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

class AdminZoomModel extends FlutterFlowModel<AdminZoomWidget> {
  ///  Local state fields for this page.

  String? cover;

  FFUploadedFile? localTrainerAvatar;

  bool hasNewTrainerAvatar = false;

  FFUploadedFile? localTrainerAvatar2;

  bool hasNewTrainerAvatar2 = false;

  ///  State fields for stateful widgets in this page.

  // Model for AdminNavBar component.
  late AdminNavBarModel adminNavBarModel;
  // Stores action output result for [Custom Action - dateTimeCombineEuropeBerlin] action in Save widget.
  DateTime? dateTimeZoom1;
  // Stores action output result for [Custom Action - dateTimeCombineEuropeBerlin] action in Save widget.
  DateTime? dateTimeZoom2;
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
  // State field(s) for descEn widget.
  FocusNode? descEnFocusNode;
  TextEditingController? descEnTextController;
  String? Function(BuildContext, String?)? descEnTextControllerValidator;
  // State field(s) for descDe widget.
  FocusNode? descDeFocusNode;
  TextEditingController? descDeTextController;
  String? Function(BuildContext, String?)? descDeTextControllerValidator;
  // State field(s) for descJa widget.
  FocusNode? descJaFocusNode;
  TextEditingController? descJaTextController;
  String? Function(BuildContext, String?)? descJaTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for link widget.
  FocusNode? linkFocusNode;
  TextEditingController? linkTextController;
  String? Function(BuildContext, String?)? linkTextControllerValidator;
  bool isDataUploading_uploadedTrainerAvatarFromLocalWidget = false;
  FFUploadedFile uploadedLocalFile_uploadedTrainerAvatarFromLocalWidget =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadedTrainerAvatar = false;
  FFUploadedFile uploadedLocalFile_uploadedTrainerAvatar =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadedAvatar = false;
  FFUploadedFile uploadedLocalFile_uploadedAvatar =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedAvatar = '';

  // State field(s) for trainerNameAndSurname widget.
  FocusNode? trainerNameAndSurnameFocusNode;
  TextEditingController? trainerNameAndSurnameTextController;
  String? Function(BuildContext, String?)?
      trainerNameAndSurnameTextControllerValidator;
  // State field(s) for freeSwitch widget.
  bool? freeSwitchValue;
  bool isDataUploading_uploadDataCoverZoom = false;
  FFUploadedFile uploadedLocalFile_uploadDataCoverZoom =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataCoverZoom = '';

  // State field(s) for textEn2 widget.
  FocusNode? textEn2FocusNode;
  TextEditingController? textEn2TextController;
  String? Function(BuildContext, String?)? textEn2TextControllerValidator;
  // State field(s) for textDe2 widget.
  FocusNode? textDe2FocusNode;
  TextEditingController? textDe2TextController;
  String? Function(BuildContext, String?)? textDe2TextControllerValidator;
  // State field(s) for textJa2 widget.
  FocusNode? textJa2FocusNode;
  TextEditingController? textJa2TextController;
  String? Function(BuildContext, String?)? textJa2TextControllerValidator;
  // State field(s) for descEn2 widget.
  FocusNode? descEn2FocusNode;
  TextEditingController? descEn2TextController;
  String? Function(BuildContext, String?)? descEn2TextControllerValidator;
  // State field(s) for descDe2 widget.
  FocusNode? descDe2FocusNode;
  TextEditingController? descDe2TextController;
  String? Function(BuildContext, String?)? descDe2TextControllerValidator;
  // State field(s) for descJa2 widget.
  FocusNode? descJa2FocusNode;
  TextEditingController? descJa2TextController;
  String? Function(BuildContext, String?)? descJa2TextControllerValidator;
  DateTime? datePicked3;
  DateTime? datePicked4;
  // State field(s) for link2 widget.
  FocusNode? link2FocusNode;
  TextEditingController? link2TextController;
  String? Function(BuildContext, String?)? link2TextControllerValidator;
  bool isDataUploading_uploadedTrainerAvatarFromLocalWidget2 = false;
  FFUploadedFile uploadedLocalFile_uploadedTrainerAvatarFromLocalWidget2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadedTrainerAvatar2 = false;
  FFUploadedFile uploadedLocalFile_uploadedTrainerAvatar2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadedAvatar2 = false;
  FFUploadedFile uploadedLocalFile_uploadedAvatar2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedAvatar2 = '';

  // State field(s) for trainerNameAndSurname2 widget.
  FocusNode? trainerNameAndSurname2FocusNode;
  TextEditingController? trainerNameAndSurname2TextController;
  String? Function(BuildContext, String?)?
      trainerNameAndSurname2TextControllerValidator;
  // State field(s) for freeSwitch2 widget.
  bool? freeSwitch2Value;

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

    descEnFocusNode?.dispose();
    descEnTextController?.dispose();

    descDeFocusNode?.dispose();
    descDeTextController?.dispose();

    descJaFocusNode?.dispose();
    descJaTextController?.dispose();

    linkFocusNode?.dispose();
    linkTextController?.dispose();

    trainerNameAndSurnameFocusNode?.dispose();
    trainerNameAndSurnameTextController?.dispose();

    textEn2FocusNode?.dispose();
    textEn2TextController?.dispose();

    textDe2FocusNode?.dispose();
    textDe2TextController?.dispose();

    textJa2FocusNode?.dispose();
    textJa2TextController?.dispose();

    descEn2FocusNode?.dispose();
    descEn2TextController?.dispose();

    descDe2FocusNode?.dispose();
    descDe2TextController?.dispose();

    descJa2FocusNode?.dispose();
    descJa2TextController?.dispose();

    link2FocusNode?.dispose();
    link2TextController?.dispose();

    trainerNameAndSurname2FocusNode?.dispose();
    trainerNameAndSurname2TextController?.dispose();
  }
}

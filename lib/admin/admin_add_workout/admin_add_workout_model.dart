import '/admin/admin_components/admin_nav_bar/admin_nav_bar_widget.dart';
import '/admin/admin_components/admin_save_dialog/admin_save_dialog_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'admin_add_workout_widget.dart' show AdminAddWorkoutWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAddWorkoutModel extends FlutterFlowModel<AdminAddWorkoutWidget> {
  ///  Local state fields for this page.

  String? cover;

  String? videoEn;

  String? videoDe;

  String? videoJa;

  ///  State fields for stateful widgets in this page.

  // Model for AdminNavBar component.
  late AdminNavBarModel adminNavBarModel;
  // State field(s) for nameSeason widget.
  FocusNode? nameSeasonFocusNode;
  TextEditingController? nameSeasonTextController;
  String? Function(BuildContext, String?)? nameSeasonTextControllerValidator;
  // State field(s) for index widget.
  FocusNode? indexFocusNode;
  TextEditingController? indexTextController;
  String? Function(BuildContext, String?)? indexTextControllerValidator;
  // State field(s) for points widget.
  FocusNode? pointsFocusNode;
  TextEditingController? pointsTextController;
  String? Function(BuildContext, String?)? pointsTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for textEn widget.
  FocusNode? textEnFocusNode;
  TextEditingController? textEnTextController;
  String? Function(BuildContext, String?)? textEnTextControllerValidator;
  // State field(s) for durationEn widget.
  FocusNode? durationEnFocusNode;
  TextEditingController? durationEnTextController;
  String? Function(BuildContext, String?)? durationEnTextControllerValidator;
  bool isDataUploading_uploadDataCoverAddwork = false;
  FFUploadedFile uploadedLocalFile_uploadDataCoverAddwork =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataCoverAddwork = '';

  bool isDataUploading_uploadDataVideoEnAddwork = false;
  FFUploadedFile uploadedLocalFile_uploadDataVideoEnAddwork =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataVideoEnAddwork = '';

  // State field(s) for textDe widget.
  FocusNode? textDeFocusNode;
  TextEditingController? textDeTextController;
  String? Function(BuildContext, String?)? textDeTextControllerValidator;
  // State field(s) for durationDE widget.
  FocusNode? durationDEFocusNode;
  TextEditingController? durationDETextController;
  String? Function(BuildContext, String?)? durationDETextControllerValidator;
  bool isDataUploading_uploadDataVideoDeAddwork = false;
  FFUploadedFile uploadedLocalFile_uploadDataVideoDeAddwork =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataVideoDeAddwork = '';

  // State field(s) for textJa widget.
  FocusNode? textJaFocusNode;
  TextEditingController? textJaTextController;
  String? Function(BuildContext, String?)? textJaTextControllerValidator;
  // State field(s) for durationJa widget.
  FocusNode? durationJaFocusNode;
  TextEditingController? durationJaTextController;
  String? Function(BuildContext, String?)? durationJaTextControllerValidator;
  bool isDataUploading_uploadDataVideoJaAddwork = false;
  FFUploadedFile uploadedLocalFile_uploadDataVideoJaAddwork =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataVideoJaAddwork = '';

  @override
  void initState(BuildContext context) {
    adminNavBarModel = createModel(context, () => AdminNavBarModel());
  }

  @override
  void dispose() {
    adminNavBarModel.dispose();
    nameSeasonFocusNode?.dispose();
    nameSeasonTextController?.dispose();

    indexFocusNode?.dispose();
    indexTextController?.dispose();

    pointsFocusNode?.dispose();
    pointsTextController?.dispose();

    tabBarController?.dispose();
    textEnFocusNode?.dispose();
    textEnTextController?.dispose();

    durationEnFocusNode?.dispose();
    durationEnTextController?.dispose();

    textDeFocusNode?.dispose();
    textDeTextController?.dispose();

    durationDEFocusNode?.dispose();
    durationDETextController?.dispose();

    textJaFocusNode?.dispose();
    textJaTextController?.dispose();

    durationJaFocusNode?.dispose();
    durationJaTextController?.dispose();
  }
}

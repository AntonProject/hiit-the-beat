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
import 'admin_edit_addit_widget.dart' show AdminEditAdditWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminEditAdditModel extends FlutterFlowModel<AdminEditAdditWidget> {
  ///  Local state fields for this page.

  String? cover;

  String? videoEn;

  String? videoDe;

  bool en = false;

  bool de = false;

  bool ja = false;

  String? videoJA;

  ///  State fields for stateful widgets in this page.

  // Model for AdminNavBar component.
  late AdminNavBarModel adminNavBarModel;
  // State field(s) for index widget.
  FocusNode? indexFocusNode;
  TextEditingController? indexTextController;
  String? Function(BuildContext, String?)? indexTextControllerValidator;
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
  // State field(s) for durationEN widget.
  FocusNode? durationENFocusNode;
  TextEditingController? durationENTextController;
  String? Function(BuildContext, String?)? durationENTextControllerValidator;
  bool isDataUploading_uploadDataCoverEdit = false;
  FFUploadedFile uploadedLocalFile_uploadDataCoverEdit =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataCoverEdit = '';

  bool isDataUploading_uploadDataVideoEnEdit = false;
  FFUploadedFile uploadedLocalFile_uploadDataVideoEnEdit =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataVideoEnEdit = '';

  // State field(s) for textDe widget.
  FocusNode? textDeFocusNode;
  TextEditingController? textDeTextController;
  String? Function(BuildContext, String?)? textDeTextControllerValidator;
  // State field(s) for durationDE widget.
  FocusNode? durationDEFocusNode;
  TextEditingController? durationDETextController;
  String? Function(BuildContext, String?)? durationDETextControllerValidator;
  bool isDataUploading_uploadDataVideoDeEdit = false;
  FFUploadedFile uploadedLocalFile_uploadDataVideoDeEdit =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataVideoDeEdit = '';

  // State field(s) for textJa widget.
  FocusNode? textJaFocusNode;
  TextEditingController? textJaTextController;
  String? Function(BuildContext, String?)? textJaTextControllerValidator;
  // State field(s) for durationJA widget.
  FocusNode? durationJAFocusNode;
  TextEditingController? durationJATextController;
  String? Function(BuildContext, String?)? durationJATextControllerValidator;
  bool isDataUploading_uploadDataVideoJAEdit = false;
  FFUploadedFile uploadedLocalFile_uploadDataVideoJAEdit =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataVideoJAEdit = '';

  @override
  void initState(BuildContext context) {
    adminNavBarModel = createModel(context, () => AdminNavBarModel());
  }

  @override
  void dispose() {
    adminNavBarModel.dispose();
    indexFocusNode?.dispose();
    indexTextController?.dispose();

    tabBarController?.dispose();
    textEnFocusNode?.dispose();
    textEnTextController?.dispose();

    durationENFocusNode?.dispose();
    durationENTextController?.dispose();

    textDeFocusNode?.dispose();
    textDeTextController?.dispose();

    durationDEFocusNode?.dispose();
    durationDETextController?.dispose();

    textJaFocusNode?.dispose();
    textJaTextController?.dispose();

    durationJAFocusNode?.dispose();
    durationJATextController?.dispose();
  }
}

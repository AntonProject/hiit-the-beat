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
import 'admin_add_banner_widget.dart' show AdminAddBannerWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAddBannerModel extends FlutterFlowModel<AdminAddBannerWidget> {
  ///  Local state fields for this page.

  String? cover;

  String? videoEn;

  String? videoDe;

  String? coverDe;

  String? coverJa;

  String? videoJa;

  ///  State fields for stateful widgets in this page.

  // Model for AdminNavBar component.
  late AdminNavBarModel adminNavBarModel;
  // State field(s) for index widget.
  FocusNode? indexFocusNode;
  TextEditingController? indexTextController;
  String? Function(BuildContext, String?)? indexTextControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for linkEn widget.
  FocusNode? linkEnFocusNode;
  TextEditingController? linkEnTextController;
  String? Function(BuildContext, String?)? linkEnTextControllerValidator;
  bool isDataUploading_uploadDataCoveEditbannerEn = false;
  FFUploadedFile uploadedLocalFile_uploadDataCoveEditbannerEn =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataCoveEditbannerEn = '';

  bool isDataUploading_uploadDataVideoEnEditbanner = false;
  FFUploadedFile uploadedLocalFile_uploadDataVideoEnEditbanner =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataVideoEnEditbanner = '';

  // State field(s) for linkDe widget.
  FocusNode? linkDeFocusNode;
  TextEditingController? linkDeTextController;
  String? Function(BuildContext, String?)? linkDeTextControllerValidator;
  bool isDataUploading_uploadDataCoverAddbannerDe = false;
  FFUploadedFile uploadedLocalFile_uploadDataCoverAddbannerDe =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataCoverAddbannerDe = '';

  bool isDataUploading_uploadDataVideoDeAddbanner = false;
  FFUploadedFile uploadedLocalFile_uploadDataVideoDeAddbanner =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataVideoDeAddbanner = '';

  // State field(s) for linkJa widget.
  FocusNode? linkJaFocusNode;
  TextEditingController? linkJaTextController;
  String? Function(BuildContext, String?)? linkJaTextControllerValidator;
  bool isDataUploading_uploadDataCoverAddbannerJa = false;
  FFUploadedFile uploadedLocalFile_uploadDataCoverAddbannerJa =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataCoverAddbannerJa = '';

  bool isDataUploading_uploadDataVideoJaAddbanner = false;
  FFUploadedFile uploadedLocalFile_uploadDataVideoJaAddbanner =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataVideoJaAddbanner = '';

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
    linkEnFocusNode?.dispose();
    linkEnTextController?.dispose();

    linkDeFocusNode?.dispose();
    linkDeTextController?.dispose();

    linkJaFocusNode?.dispose();
    linkJaTextController?.dispose();
  }
}

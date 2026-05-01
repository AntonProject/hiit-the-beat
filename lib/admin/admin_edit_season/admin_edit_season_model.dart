import '/admin/admin_components/admin_nav_bar/admin_nav_bar_widget.dart';
import '/admin/admin_components/admin_save_dialog/admin_save_dialog_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'admin_edit_season_widget.dart' show AdminEditSeasonWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminEditSeasonModel extends FlutterFlowModel<AdminEditSeasonWidget> {
  ///  Local state fields for this page.

  String? cover;

  int levelP = 1;

  bool en = true;

  bool de = true;

  DateTime? date;

  bool ja = false;

  ///  State fields for stateful widgets in this page.

  // Model for AdminNavBar component.
  late AdminNavBarModel adminNavBarModel;
  // State field(s) for number widget.
  FocusNode? numberFocusNode;
  TextEditingController? numberTextController;
  String? Function(BuildContext, String?)? numberTextControllerValidator;
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
  // State field(s) for duration widget.
  FocusNode? durationFocusNode;
  TextEditingController? durationTextController;
  String? Function(BuildContext, String?)? durationTextControllerValidator;
  bool isDataUploading_uploadDataCoverEditseason = false;
  FFUploadedFile uploadedLocalFile_uploadDataCoverEditseason =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataCoverEditseason = '';

  // State field(s) for textDe widget.
  FocusNode? textDeFocusNode;
  TextEditingController? textDeTextController;
  String? Function(BuildContext, String?)? textDeTextControllerValidator;
  // State field(s) for durationDe widget.
  FocusNode? durationDeFocusNode;
  TextEditingController? durationDeTextController;
  String? Function(BuildContext, String?)? durationDeTextControllerValidator;
  // State field(s) for textJa widget.
  FocusNode? textJaFocusNode;
  TextEditingController? textJaTextController;
  String? Function(BuildContext, String?)? textJaTextControllerValidator;
  // State field(s) for durationJa widget.
  FocusNode? durationJaFocusNode;
  TextEditingController? durationJaTextController;
  String? Function(BuildContext, String?)? durationJaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    adminNavBarModel = createModel(context, () => AdminNavBarModel());
  }

  @override
  void dispose() {
    adminNavBarModel.dispose();
    numberFocusNode?.dispose();
    numberTextController?.dispose();

    tabBarController?.dispose();
    textEnFocusNode?.dispose();
    textEnTextController?.dispose();

    durationFocusNode?.dispose();
    durationTextController?.dispose();

    textDeFocusNode?.dispose();
    textDeTextController?.dispose();

    durationDeFocusNode?.dispose();
    durationDeTextController?.dispose();

    textJaFocusNode?.dispose();
    textJaTextController?.dispose();

    durationJaFocusNode?.dispose();
    durationJaTextController?.dispose();
  }
}

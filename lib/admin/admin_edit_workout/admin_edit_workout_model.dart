import '/admin/admin_components/admin_nav_bar/admin_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'admin_edit_workout_widget.dart' show AdminEditWorkoutWidget;
import 'package:flutter/material.dart';

class AdminEditWorkoutModel extends FlutterFlowModel<AdminEditWorkoutWidget> {
  ///  Local state fields for this page.

  String? cover;

  String? videoEn;

  String? videoDe;

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

  // State field(s) for textEn widget.
  FocusNode? textEnFocusNode;
  TextEditingController? textEnTextController;
  String? Function(BuildContext, String?)? textEnTextControllerValidator;
  // State field(s) for duration widget.
  FocusNode? durationFocusNode;
  TextEditingController? durationTextController;
  String? Function(BuildContext, String?)? durationTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for textDe widget.
  FocusNode? textDeFocusNode;
  TextEditingController? textDeTextController;
  String? Function(BuildContext, String?)? textDeTextControllerValidator;
  // State field(s) for durationDe widget.
  FocusNode? durationDeFocusNode;
  TextEditingController? durationDeTextController;
  String? Function(BuildContext, String?)? durationDeTextControllerValidator;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

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

    durationFocusNode?.dispose();
    durationTextController?.dispose();

    textDeFocusNode?.dispose();
    textDeTextController?.dispose();

    durationDeFocusNode?.dispose();
    durationDeTextController?.dispose();
  }
}

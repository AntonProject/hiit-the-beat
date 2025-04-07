import '/admin/admin_components/admin_nav_bar/admin_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'admin_add_season_widget.dart' show AdminAddSeasonWidget;
import 'package:flutter/material.dart';

class AdminAddSeasonModel extends FlutterFlowModel<AdminAddSeasonWidget> {
  ///  Local state fields for this page.

  String? cover;

  int levelP = 1;

  bool en = true;

  bool de = true;

  DateTime? date;

  ///  State fields for stateful widgets in this page.

  // Model for AdminNavBar component.
  late AdminNavBarModel adminNavBarModel;
  // State field(s) for number widget.
  FocusNode? numberFocusNode;
  TextEditingController? numberTextController;
  String? Function(BuildContext, String?)? numberTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for textEn widget.
  FocusNode? textEnFocusNode;
  TextEditingController? textEnTextController;
  String? Function(BuildContext, String?)? textEnTextControllerValidator;
  // State field(s) for durationEN widget.
  FocusNode? durationENFocusNode;
  TextEditingController? durationENTextController;
  String? Function(BuildContext, String?)? durationENTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for textDe widget.
  FocusNode? textDeFocusNode;
  TextEditingController? textDeTextController;
  String? Function(BuildContext, String?)? textDeTextControllerValidator;
  // State field(s) for durationDE widget.
  FocusNode? durationDEFocusNode;
  TextEditingController? durationDETextController;
  String? Function(BuildContext, String?)? durationDETextControllerValidator;

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

    durationENFocusNode?.dispose();
    durationENTextController?.dispose();

    textDeFocusNode?.dispose();
    textDeTextController?.dispose();

    durationDEFocusNode?.dispose();
    durationDETextController?.dispose();
  }
}

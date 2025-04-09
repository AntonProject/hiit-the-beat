import '/admin/admin_components/admin_nav_bar/admin_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'admin_zoom_widget.dart' show AdminZoomWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminZoomModel extends FlutterFlowModel<AdminZoomWidget> {
  ///  Local state fields for this page.

  String? cover;

  ///  State fields for stateful widgets in this page.

  // Model for AdminNavBar component.
  late AdminNavBarModel adminNavBarModel;
  // State field(s) for textEn widget.
  FocusNode? textEnFocusNode;
  TextEditingController? textEnTextController;
  String? Function(BuildContext, String?)? textEnTextControllerValidator;
  // State field(s) for textDe widget.
  FocusNode? textDeFocusNode;
  TextEditingController? textDeTextController;
  String? Function(BuildContext, String?)? textDeTextControllerValidator;
  // State field(s) for descEn widget.
  FocusNode? descEnFocusNode;
  TextEditingController? descEnTextController;
  String? Function(BuildContext, String?)? descEnTextControllerValidator;
  // State field(s) for descDe widget.
  FocusNode? descDeFocusNode;
  TextEditingController? descDeTextController;
  String? Function(BuildContext, String?)? descDeTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for link widget.
  FocusNode? linkFocusNode;
  TextEditingController? linkTextController;
  String? Function(BuildContext, String?)? linkTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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

    descEnFocusNode?.dispose();
    descEnTextController?.dispose();

    descDeFocusNode?.dispose();
    descDeTextController?.dispose();

    linkFocusNode?.dispose();
    linkTextController?.dispose();
  }
}

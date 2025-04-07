import '/admin/admin_components/admin_nav_bar/admin_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'admin_add_promo_widget.dart' show AdminAddPromoWidget;
import 'package:flutter/material.dart';

class AdminAddPromoModel extends FlutterFlowModel<AdminAddPromoWidget> {
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
  // State field(s) for Switch widget.
  bool? switchValue;

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
  }
}

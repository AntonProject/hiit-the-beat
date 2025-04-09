import '/admin/admin_components/admin_nav_bar/admin_nav_bar_widget.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_user_management_widget.dart' show AdminUserManagementWidget;
import 'package:flutter/material.dart';

class AdminUserManagementModel
    extends FlutterFlowModel<AdminUserManagementWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AdminNavBar component.
  late AdminNavBarModel adminNavBarModel;
  // State field(s) for Searchbynamesurname widget.
  FocusNode? searchbynamesurnameFocusNode;
  TextEditingController? searchbynamesurnameTextController;
  String? Function(BuildContext, String?)?
      searchbynamesurnameTextControllerValidator;
  // Stores action output result for [Cloud Function - exportToExcel] action in ExporttoExcel widget.
  ExportToExcelCloudFunctionCallResponse? cloudFunction;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<UsersRecord>();

  @override
  void initState(BuildContext context) {
    adminNavBarModel = createModel(context, () => AdminNavBarModel());
  }

  @override
  void dispose() {
    adminNavBarModel.dispose();
    searchbynamesurnameFocusNode?.dispose();
    searchbynamesurnameTextController?.dispose();

    paginatedDataTableController.dispose();
  }
}

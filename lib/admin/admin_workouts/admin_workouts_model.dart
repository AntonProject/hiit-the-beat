import '/admin/admin_components/admin_nav_bar/admin_nav_bar_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'admin_workouts_widget.dart' show AdminWorkoutsWidget;
import 'package:flutter/material.dart';

class AdminWorkoutsModel extends FlutterFlowModel<AdminWorkoutsWidget> {
  ///  Local state fields for this page.

  int? tab = 1;

  ///  State fields for stateful widgets in this page.

  // Model for AdminNavBar component.
  late AdminNavBarModel adminNavBarModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<WorkoutsRecord>();

  @override
  void initState(BuildContext context) {
    adminNavBarModel = createModel(context, () => AdminNavBarModel());
  }

  @override
  void dispose() {
    adminNavBarModel.dispose();
    paginatedDataTableController.dispose();
  }
}

import '/admin/admin_components/admin_additional_dialog/admin_additional_dialog_widget.dart';
import '/admin/admin_components/admin_nav_bar/admin_nav_bar_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'admin_additional_widget.dart' show AdminAdditionalWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAdditionalModel extends FlutterFlowModel<AdminAdditionalWidget> {
  ///  Local state fields for this page.

  int? tab = 1;

  ///  State fields for stateful widgets in this page.

  // Model for AdminNavBar component.
  late AdminNavBarModel adminNavBarModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<AdditionalsRecord>();

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

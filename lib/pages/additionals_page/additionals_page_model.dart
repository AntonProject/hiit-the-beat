import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/additional_comp/additional_comp_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/skeleton/skeleton_add_grid/skeleton_add_grid_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'additionals_page_widget.dart' show AdditionalsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdditionalsPageModel extends FlutterFlowModel<AdditionalsPageWidget> {
  ///  Local state fields for this page.

  int tab = 1;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for additionalComp dynamic component.
  late FlutterFlowDynamicModels<AdditionalCompModel> additionalCompModels;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    additionalCompModels =
        FlutterFlowDynamicModels(() => AdditionalCompModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    additionalCompModels.dispose();
    navbarModel.dispose();
  }
}

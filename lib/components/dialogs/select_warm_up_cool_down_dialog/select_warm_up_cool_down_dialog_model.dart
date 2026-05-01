import '/backend/backend.dart';
import '/components/additional_comp_dialog/additional_comp_dialog_widget.dart';
import '/components/skeleton/skeleton_add_comp_list/skeleton_add_comp_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'select_warm_up_cool_down_dialog_widget.dart'
    show SelectWarmUpCoolDownDialogWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectWarmUpCoolDownDialogModel
    extends FlutterFlowModel<SelectWarmUpCoolDownDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for additionalCompDialog dynamic component.
  late FlutterFlowDynamicModels<AdditionalCompDialogModel>
      additionalCompDialogModels;

  @override
  void initState(BuildContext context) {
    additionalCompDialogModels =
        FlutterFlowDynamicModels(() => AdditionalCompDialogModel());
  }

  @override
  void dispose() {
    additionalCompDialogModels.dispose();
  }
}

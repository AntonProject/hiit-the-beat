import '/components/additional_comp_dialog/additional_comp_dialog_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'select_warm_up_cool_down_dialog_widget.dart'
    show SelectWarmUpCoolDownDialogWidget;
import 'package:flutter/material.dart';

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

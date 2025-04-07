import '/components/navbar_active_button/navbar_active_button_widget.dart';
import '/components/navbar_inactive_button/navbar_inactive_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'navbar_widget.dart' show NavbarWidget;
import 'package:flutter/material.dart';

class NavbarModel extends FlutterFlowModel<NavbarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for homeActiveButton.
  late NavbarActiveButtonModel homeActiveButtonModel;
  // Model for homeInactiveButton.
  late NavbarInactiveButtonModel homeInactiveButtonModel;
  // Model for workoutActiveButton.
  late NavbarActiveButtonModel workoutActiveButtonModel;
  // Model for workoutInactiveButton.
  late NavbarInactiveButtonModel workoutInactiveButtonModel;
  // Model for addActiveButton.
  late NavbarActiveButtonModel addActiveButtonModel;
  // Model for addInactiveButton.
  late NavbarInactiveButtonModel addInactiveButtonModel;
  // Model for profileActiveButton.
  late NavbarActiveButtonModel profileActiveButtonModel;
  // Model for profileInactiveButton.
  late NavbarInactiveButtonModel profileInactiveButtonModel;

  @override
  void initState(BuildContext context) {
    homeActiveButtonModel =
        createModel(context, () => NavbarActiveButtonModel());
    homeInactiveButtonModel =
        createModel(context, () => NavbarInactiveButtonModel());
    workoutActiveButtonModel =
        createModel(context, () => NavbarActiveButtonModel());
    workoutInactiveButtonModel =
        createModel(context, () => NavbarInactiveButtonModel());
    addActiveButtonModel =
        createModel(context, () => NavbarActiveButtonModel());
    addInactiveButtonModel =
        createModel(context, () => NavbarInactiveButtonModel());
    profileActiveButtonModel =
        createModel(context, () => NavbarActiveButtonModel());
    profileInactiveButtonModel =
        createModel(context, () => NavbarInactiveButtonModel());
  }

  @override
  void dispose() {
    homeActiveButtonModel.dispose();
    homeInactiveButtonModel.dispose();
    workoutActiveButtonModel.dispose();
    workoutInactiveButtonModel.dispose();
    addActiveButtonModel.dispose();
    addInactiveButtonModel.dispose();
    profileActiveButtonModel.dispose();
    profileInactiveButtonModel.dispose();
  }
}

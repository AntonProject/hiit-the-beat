import '/components/becomea_h_i_i_tthe_beat_trainer/becomea_h_i_i_tthe_beat_trainer_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/profile_menu_option/profile_menu_option_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BecomeaHIITtheBeatTrainer component.
  late BecomeaHIITtheBeatTrainerModel becomeaHIITtheBeatTrainerModel;
  // Model for profileMenuOption component.
  late ProfileMenuOptionModel profileMenuOptionModel1;
  // Model for profileMenuOption component.
  late ProfileMenuOptionModel profileMenuOptionModel2;
  // Model for profileMenuOption component.
  late ProfileMenuOptionModel profileMenuOptionModel3;
  // Model for profileMenuOption component.
  late ProfileMenuOptionModel profileMenuOptionModel4;
  // Model for profileMenuOption component.
  late ProfileMenuOptionModel profileMenuOptionModel5;
  // Model for profileMenuOption component.
  late ProfileMenuOptionModel profileMenuOptionModel6;
  // Model for profileMenuOption component.
  late ProfileMenuOptionModel profileMenuOptionModel7;
  // Model for profileMenuOption component.
  late ProfileMenuOptionModel profileMenuOptionModel8;
  // Model for profileMenuOption component.
  late ProfileMenuOptionModel profileMenuOptionModel9;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    becomeaHIITtheBeatTrainerModel =
        createModel(context, () => BecomeaHIITtheBeatTrainerModel());
    profileMenuOptionModel1 =
        createModel(context, () => ProfileMenuOptionModel());
    profileMenuOptionModel2 =
        createModel(context, () => ProfileMenuOptionModel());
    profileMenuOptionModel3 =
        createModel(context, () => ProfileMenuOptionModel());
    profileMenuOptionModel4 =
        createModel(context, () => ProfileMenuOptionModel());
    profileMenuOptionModel5 =
        createModel(context, () => ProfileMenuOptionModel());
    profileMenuOptionModel6 =
        createModel(context, () => ProfileMenuOptionModel());
    profileMenuOptionModel7 =
        createModel(context, () => ProfileMenuOptionModel());
    profileMenuOptionModel8 =
        createModel(context, () => ProfileMenuOptionModel());
    profileMenuOptionModel9 =
        createModel(context, () => ProfileMenuOptionModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    becomeaHIITtheBeatTrainerModel.dispose();
    profileMenuOptionModel1.dispose();
    profileMenuOptionModel2.dispose();
    profileMenuOptionModel3.dispose();
    profileMenuOptionModel4.dispose();
    profileMenuOptionModel5.dispose();
    profileMenuOptionModel6.dispose();
    profileMenuOptionModel7.dispose();
    profileMenuOptionModel8.dispose();
    profileMenuOptionModel9.dispose();
    navbarModel.dispose();
  }
}

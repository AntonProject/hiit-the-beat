import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/becomea_h_i_i_tthe_beat_trainer/becomea_h_i_i_tthe_beat_trainer_widget.dart';
import '/components/dialogs/guest_dialog/guest_dialog_widget.dart';
import '/components/dialogs/log_out_dialog/log_out_dialog_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/profile_menu_option/profile_menu_option_widget.dart';
import '/components/skeleton/skeleton_homezoom/skeleton_homezoom_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
    navbarModel.dispose();
  }
}

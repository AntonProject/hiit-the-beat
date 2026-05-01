import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/dialogs/filter_season_dialog/filter_season_dialog_widget.dart';
import '/components/dialogs/guest_dialog/guest_dialog_widget.dart';
import '/components/dialogs/onboarding_home_step2/onboarding_home_step2_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/season_main_comp/season_main_comp_widget.dart';
import '/components/skeleton/skeleton_season_main_list/skeleton_season_main_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'season_workout_page_widget.dart' show SeasonWorkoutPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SeasonWorkoutPageModel extends FlutterFlowModel<SeasonWorkoutPageWidget> {
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
  // Models for seasonMainComp dynamic component.
  late FlutterFlowDynamicModels<SeasonMainCompModel> seasonMainCompModels;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    seasonMainCompModels =
        FlutterFlowDynamicModels(() => SeasonMainCompModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    seasonMainCompModels.dispose();
    navbarModel.dispose();
  }
}

import '/components/navbar/navbar_widget.dart';
import '/components/season_main_comp/season_main_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'season_workout_page_widget.dart' show SeasonWorkoutPageWidget;
import 'package:flutter/material.dart';

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

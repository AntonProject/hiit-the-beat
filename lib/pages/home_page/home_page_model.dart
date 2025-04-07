import '/backend/backend.dart';
import '/components/becomea_h_i_i_tthe_beat_trainer/becomea_h_i_i_tthe_beat_trainer_widget.dart';
import '/components/h_i_i_tthe_beat_shop/h_i_i_tthe_beat_shop_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/season_comp/season_comp_widget.dart';
import '/components/watchtheintroductoryvideo/watchtheintroductoryvideo_widget.dart';
import '/components/z_o_o_m_live_workout_jam/z_o_o_m_live_workout_jam_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ZOOMLiveWorkoutJam component.
  late ZOOMLiveWorkoutJamModel zOOMLiveWorkoutJamModel;
  // Model for BecomeaHIITtheBeatTrainer component.
  late BecomeaHIITtheBeatTrainerModel becomeaHIITtheBeatTrainerModel;
  // Model for HIITtheBeatShop component.
  late HIITtheBeatShopModel hIITtheBeatShopModel;
  // Model for Watchtheintroductoryvideo component.
  late WatchtheintroductoryvideoModel watchtheintroductoryvideoModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for seasonComp dynamic component.
  late FlutterFlowDynamicModels<SeasonCompModel> seasonCompModels;
  // Model for navbar component.
  late NavbarModel navbarModel;

  /// Query cache managers for this widget.

  final _workoutsManager = FutureRequestManager<List<WorkoutsRecord>>();
  Future<List<WorkoutsRecord>> workouts({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<WorkoutsRecord>> Function() requestFn,
  }) =>
      _workoutsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearWorkoutsCache() => _workoutsManager.clear();
  void clearWorkoutsCacheKey(String? uniqueKey) =>
      _workoutsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    zOOMLiveWorkoutJamModel =
        createModel(context, () => ZOOMLiveWorkoutJamModel());
    becomeaHIITtheBeatTrainerModel =
        createModel(context, () => BecomeaHIITtheBeatTrainerModel());
    hIITtheBeatShopModel = createModel(context, () => HIITtheBeatShopModel());
    watchtheintroductoryvideoModel =
        createModel(context, () => WatchtheintroductoryvideoModel());
    seasonCompModels = FlutterFlowDynamicModels(() => SeasonCompModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    zOOMLiveWorkoutJamModel.dispose();
    becomeaHIITtheBeatTrainerModel.dispose();
    hIITtheBeatShopModel.dispose();
    watchtheintroductoryvideoModel.dispose();
    seasonCompModels.dispose();
    navbarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearWorkoutsCache();
  }
}

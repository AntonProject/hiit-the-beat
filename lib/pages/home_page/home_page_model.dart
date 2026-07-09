import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/h_i_i_tthe_beat_shop/h_i_i_tthe_beat_shop_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/season_comp/season_comp_widget.dart';
import '/components/skeleton/skeleton_season_home_raw/skeleton_season_home_raw_widget.dart';
import '/components/skeleton/skeleton_season_raw/skeleton_season_raw_widget.dart';
import '/components/watchtheintroductoryvideo/watchtheintroductoryvideo_widget.dart';
import '/components/z_o_o_m_live_workout_jam_list/z_o_o_m_live_workout_jam_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - allSeasonDoneByLevel] action in Button widget.
  bool? allSeasonDone;
  // Stores action output result for [Custom Action - seasonIdNext] action in Button widget.
  SeasonsRecord? nextSeason;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? countNext;
  // Stores action output result for [Custom Action - seasonId] action in Button widget.
  SeasonsRecord? seasonLvl;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? count;
  // Stores action output result for [Custom Action - workoutById] action in Button widget.
  WorkoutsRecord? workDoc;
  // Model for Watchtheintroductoryvideo component.
  late WatchtheintroductoryvideoModel watchtheintroductoryvideoModel;
  // Model for ZOOMLiveWorkoutJamList component.
  late ZOOMLiveWorkoutJamListModel zOOMLiveWorkoutJamListModel;
  // Model for HIITtheBeatShop component.
  late HIITtheBeatShopModel hIITtheBeatShopModel;
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

  @override
  void initState(BuildContext context) {
    watchtheintroductoryvideoModel =
        createModel(context, () => WatchtheintroductoryvideoModel());
    zOOMLiveWorkoutJamListModel =
        createModel(context, () => ZOOMLiveWorkoutJamListModel());
    hIITtheBeatShopModel = createModel(context, () => HIITtheBeatShopModel());
    seasonCompModels = FlutterFlowDynamicModels(() => SeasonCompModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    watchtheintroductoryvideoModel.dispose();
    zOOMLiveWorkoutJamListModel.dispose();
    hIITtheBeatShopModel.dispose();
    seasonCompModels.dispose();
    navbarModel.dispose();
  }
}

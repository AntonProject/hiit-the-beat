import '/components/skeleton/skeleton_season_main/skeleton_season_main_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'skeleton_season_main_list_widget.dart'
    show SkeletonSeasonMainListWidget;
import 'package:flutter/material.dart';

class SkeletonSeasonMainListModel
    extends FlutterFlowModel<SkeletonSeasonMainListWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for skeletonSeasonMain component.
  late SkeletonSeasonMainModel skeletonSeasonMainModel1;
  // Model for skeletonSeasonMain component.
  late SkeletonSeasonMainModel skeletonSeasonMainModel2;

  @override
  void initState(BuildContext context) {
    skeletonSeasonMainModel1 =
        createModel(context, () => SkeletonSeasonMainModel());
    skeletonSeasonMainModel2 =
        createModel(context, () => SkeletonSeasonMainModel());
  }

  @override
  void dispose() {
    skeletonSeasonMainModel1.dispose();
    skeletonSeasonMainModel2.dispose();
  }
}

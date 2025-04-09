import '/components/skeleton/skeleton_season_raw/skeleton_season_raw_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'skeleton_season_home_raw_widget.dart' show SkeletonSeasonHomeRawWidget;
import 'package:flutter/material.dart';

class SkeletonSeasonHomeRawModel
    extends FlutterFlowModel<SkeletonSeasonHomeRawWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for skeletonSeasonRaw component.
  late SkeletonSeasonRawModel skeletonSeasonRawModel;

  @override
  void initState(BuildContext context) {
    skeletonSeasonRawModel =
        createModel(context, () => SkeletonSeasonRawModel());
  }

  @override
  void dispose() {
    skeletonSeasonRawModel.dispose();
  }
}

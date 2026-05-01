import '/components/skeleton/skeleton_season/skeleton_season_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'skeleton_season_raw_widget.dart' show SkeletonSeasonRawWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SkeletonSeasonRawModel extends FlutterFlowModel<SkeletonSeasonRawWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for skeletonSeason component.
  late SkeletonSeasonModel skeletonSeasonModel1;
  // Model for skeletonSeason component.
  late SkeletonSeasonModel skeletonSeasonModel2;

  @override
  void initState(BuildContext context) {
    skeletonSeasonModel1 = createModel(context, () => SkeletonSeasonModel());
    skeletonSeasonModel2 = createModel(context, () => SkeletonSeasonModel());
  }

  @override
  void dispose() {
    skeletonSeasonModel1.dispose();
    skeletonSeasonModel2.dispose();
  }
}

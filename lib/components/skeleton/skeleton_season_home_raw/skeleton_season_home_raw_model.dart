import '/components/skeleton/skeleton_season_raw/skeleton_season_raw_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'skeleton_season_home_raw_widget.dart' show SkeletonSeasonHomeRawWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

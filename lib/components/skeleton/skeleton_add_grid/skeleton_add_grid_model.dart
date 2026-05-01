import '/components/skeleton/skeleton_add/skeleton_add_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'skeleton_add_grid_widget.dart' show SkeletonAddGridWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SkeletonAddGridModel extends FlutterFlowModel<SkeletonAddGridWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for skeletonAdd component.
  late SkeletonAddModel skeletonAddModel1;
  // Model for skeletonAdd component.
  late SkeletonAddModel skeletonAddModel2;
  // Model for skeletonAdd component.
  late SkeletonAddModel skeletonAddModel3;
  // Model for skeletonAdd component.
  late SkeletonAddModel skeletonAddModel4;
  // Model for skeletonAdd component.
  late SkeletonAddModel skeletonAddModel5;
  // Model for skeletonAdd component.
  late SkeletonAddModel skeletonAddModel6;

  @override
  void initState(BuildContext context) {
    skeletonAddModel1 = createModel(context, () => SkeletonAddModel());
    skeletonAddModel2 = createModel(context, () => SkeletonAddModel());
    skeletonAddModel3 = createModel(context, () => SkeletonAddModel());
    skeletonAddModel4 = createModel(context, () => SkeletonAddModel());
    skeletonAddModel5 = createModel(context, () => SkeletonAddModel());
    skeletonAddModel6 = createModel(context, () => SkeletonAddModel());
  }

  @override
  void dispose() {
    skeletonAddModel1.dispose();
    skeletonAddModel2.dispose();
    skeletonAddModel3.dispose();
    skeletonAddModel4.dispose();
    skeletonAddModel5.dispose();
    skeletonAddModel6.dispose();
  }
}

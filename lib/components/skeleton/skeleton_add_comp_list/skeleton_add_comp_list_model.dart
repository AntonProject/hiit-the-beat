import '/components/skeleton/skeleton_add_comp/skeleton_add_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'skeleton_add_comp_list_widget.dart' show SkeletonAddCompListWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SkeletonAddCompListModel
    extends FlutterFlowModel<SkeletonAddCompListWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for skeletonAddComp component.
  late SkeletonAddCompModel skeletonAddCompModel1;
  // Model for skeletonAddComp component.
  late SkeletonAddCompModel skeletonAddCompModel2;
  // Model for skeletonAddComp component.
  late SkeletonAddCompModel skeletonAddCompModel3;
  // Model for skeletonAddComp component.
  late SkeletonAddCompModel skeletonAddCompModel4;

  @override
  void initState(BuildContext context) {
    skeletonAddCompModel1 = createModel(context, () => SkeletonAddCompModel());
    skeletonAddCompModel2 = createModel(context, () => SkeletonAddCompModel());
    skeletonAddCompModel3 = createModel(context, () => SkeletonAddCompModel());
    skeletonAddCompModel4 = createModel(context, () => SkeletonAddCompModel());
  }

  @override
  void dispose() {
    skeletonAddCompModel1.dispose();
    skeletonAddCompModel2.dispose();
    skeletonAddCompModel3.dispose();
    skeletonAddCompModel4.dispose();
  }
}

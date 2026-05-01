import '/components/skeleton/skeleton_add/skeleton_add_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'skeleton_add_grid_model.dart';
export 'skeleton_add_grid_model.dart';

class SkeletonAddGridWidget extends StatefulWidget {
  const SkeletonAddGridWidget({super.key});

  @override
  State<SkeletonAddGridWidget> createState() => _SkeletonAddGridWidgetState();
}

class _SkeletonAddGridWidgetState extends State<SkeletonAddGridWidget> {
  late SkeletonAddGridModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkeletonAddGridModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.95,
      ),
      scrollDirection: Axis.vertical,
      children: [
        wrapWithModel(
          model: _model.skeletonAddModel1,
          updateCallback: () => safeSetState(() {}),
          child: SkeletonAddWidget(),
        ),
        wrapWithModel(
          model: _model.skeletonAddModel2,
          updateCallback: () => safeSetState(() {}),
          child: SkeletonAddWidget(),
        ),
        wrapWithModel(
          model: _model.skeletonAddModel3,
          updateCallback: () => safeSetState(() {}),
          child: SkeletonAddWidget(),
        ),
        wrapWithModel(
          model: _model.skeletonAddModel4,
          updateCallback: () => safeSetState(() {}),
          child: SkeletonAddWidget(),
        ),
        wrapWithModel(
          model: _model.skeletonAddModel5,
          updateCallback: () => safeSetState(() {}),
          child: SkeletonAddWidget(),
        ),
        wrapWithModel(
          model: _model.skeletonAddModel6,
          updateCallback: () => safeSetState(() {}),
          child: SkeletonAddWidget(),
        ),
      ],
    );
  }
}

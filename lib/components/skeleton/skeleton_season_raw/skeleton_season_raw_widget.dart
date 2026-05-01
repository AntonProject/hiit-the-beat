import '/components/skeleton/skeleton_season/skeleton_season_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'skeleton_season_raw_model.dart';
export 'skeleton_season_raw_model.dart';

class SkeletonSeasonRawWidget extends StatefulWidget {
  const SkeletonSeasonRawWidget({super.key});

  @override
  State<SkeletonSeasonRawWidget> createState() =>
      _SkeletonSeasonRawWidgetState();
}

class _SkeletonSeasonRawWidgetState extends State<SkeletonSeasonRawWidget> {
  late SkeletonSeasonRawModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkeletonSeasonRawModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.0,
      decoration: BoxDecoration(),
      child: ListView(
        padding: EdgeInsets.fromLTRB(
          16.0,
          0,
          16.0,
          0,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          wrapWithModel(
            model: _model.skeletonSeasonModel1,
            updateCallback: () => safeSetState(() {}),
            child: SkeletonSeasonWidget(),
          ),
          wrapWithModel(
            model: _model.skeletonSeasonModel2,
            updateCallback: () => safeSetState(() {}),
            child: SkeletonSeasonWidget(),
          ),
        ].divide(SizedBox(width: 8.0)),
      ),
    );
  }
}

import '/components/skeleton/skeleton_season_raw/skeleton_season_raw_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'skeleton_season_home_raw_model.dart';
export 'skeleton_season_home_raw_model.dart';

class SkeletonSeasonHomeRawWidget extends StatefulWidget {
  const SkeletonSeasonHomeRawWidget({super.key});

  @override
  State<SkeletonSeasonHomeRawWidget> createState() =>
      _SkeletonSeasonHomeRawWidgetState();
}

class _SkeletonSeasonHomeRawWidgetState
    extends State<SkeletonSeasonHomeRawWidget> with TickerProviderStateMixin {
  late SkeletonSeasonHomeRawModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkeletonSeasonHomeRawModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 1000.0.ms,
            color: Color(0x7FE0E0E0),
            angle: 0.524,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Material(
            color: Colors.transparent,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              width: double.infinity,
              height: 24.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).middleGray,
                borderRadius: BorderRadius.circular(8.0),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
        ),
        wrapWithModel(
          model: _model.skeletonSeasonRawModel,
          updateCallback: () => safeSetState(() {}),
          child: SkeletonSeasonRawWidget(),
        ),
      ].divide(SizedBox(height: 20.0)),
    );
  }
}

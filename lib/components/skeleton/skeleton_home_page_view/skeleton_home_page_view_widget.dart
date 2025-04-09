import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'skeleton_home_page_view_model.dart';
export 'skeleton_home_page_view_model.dart';

class SkeletonHomePageViewWidget extends StatefulWidget {
  const SkeletonHomePageViewWidget({super.key});

  @override
  State<SkeletonHomePageViewWidget> createState() =>
      _SkeletonHomePageViewWidgetState();
}

class _SkeletonHomePageViewWidgetState extends State<SkeletonHomePageViewWidget>
    with TickerProviderStateMixin {
  late SkeletonHomePageViewModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkeletonHomePageViewModel());

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
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.25,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).middleGray,
            borderRadius: BorderRadius.circular(16.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.transparent,
              width: 1.0,
            ),
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}

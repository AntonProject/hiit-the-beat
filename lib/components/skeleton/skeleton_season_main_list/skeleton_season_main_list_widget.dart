import '/components/skeleton/skeleton_season_main/skeleton_season_main_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'skeleton_season_main_list_model.dart';
export 'skeleton_season_main_list_model.dart';

class SkeletonSeasonMainListWidget extends StatefulWidget {
  const SkeletonSeasonMainListWidget({super.key});

  @override
  State<SkeletonSeasonMainListWidget> createState() =>
      _SkeletonSeasonMainListWidgetState();
}

class _SkeletonSeasonMainListWidgetState
    extends State<SkeletonSeasonMainListWidget> {
  late SkeletonSeasonMainListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkeletonSeasonMainListModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          wrapWithModel(
            model: _model.skeletonSeasonMainModel1,
            updateCallback: () => safeSetState(() {}),
            child: SkeletonSeasonMainWidget(),
          ),
          wrapWithModel(
            model: _model.skeletonSeasonMainModel2,
            updateCallback: () => safeSetState(() {}),
            child: SkeletonSeasonMainWidget(),
          ),
        ].divide(SizedBox(height: 12.0)),
      ),
    );
  }
}

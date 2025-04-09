import '/components/skeleton/skeleton_add_comp/skeleton_add_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'skeleton_add_comp_list_model.dart';
export 'skeleton_add_comp_list_model.dart';

class SkeletonAddCompListWidget extends StatefulWidget {
  const SkeletonAddCompListWidget({super.key});

  @override
  State<SkeletonAddCompListWidget> createState() =>
      _SkeletonAddCompListWidgetState();
}

class _SkeletonAddCompListWidgetState extends State<SkeletonAddCompListWidget> {
  late SkeletonAddCompListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkeletonAddCompListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        8.0,
        0,
        8.0,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        wrapWithModel(
          model: _model.skeletonAddCompModel1,
          updateCallback: () => safeSetState(() {}),
          child: SkeletonAddCompWidget(),
        ),
        wrapWithModel(
          model: _model.skeletonAddCompModel2,
          updateCallback: () => safeSetState(() {}),
          child: SkeletonAddCompWidget(),
        ),
        wrapWithModel(
          model: _model.skeletonAddCompModel3,
          updateCallback: () => safeSetState(() {}),
          child: SkeletonAddCompWidget(),
        ),
        wrapWithModel(
          model: _model.skeletonAddCompModel4,
          updateCallback: () => safeSetState(() {}),
          child: SkeletonAddCompWidget(),
        ),
      ].divide(SizedBox(height: 8.0)),
    );
  }
}

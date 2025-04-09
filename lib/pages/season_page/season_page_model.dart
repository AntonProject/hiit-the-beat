import '/backend/backend.dart';
import '/components/becomeplusmember/becomeplusmember_widget.dart';
import '/components/workout_comp/workout_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'season_page_widget.dart' show SeasonPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SeasonPageModel extends FlutterFlowModel<SeasonPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, WorkoutsRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Models for workoutComp dynamic component.
  late FlutterFlowDynamicModels<WorkoutCompModel> workoutCompModels;
  // Model for becomeplusmember component.
  late BecomeplusmemberModel becomeplusmemberModel;

  @override
  void initState(BuildContext context) {
    workoutCompModels = FlutterFlowDynamicModels(() => WorkoutCompModel());
    becomeplusmemberModel = createModel(context, () => BecomeplusmemberModel());
  }

  @override
  void dispose() {
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();

    workoutCompModels.dispose();
    becomeplusmemberModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, WorkoutsRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, WorkoutsRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, WorkoutsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryWorkoutsRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'workout_page_widget.dart' show WorkoutPageWidget;
import 'package:flutter/material.dart';

class WorkoutPageModel extends FlutterFlowModel<WorkoutPageWidget> {
  ///  Local state fields for this page.

  int trainingChoose = 1;

  List<int> trainingsDone = [];
  void addToTrainingsDone(int item) => trainingsDone.add(item);
  void removeFromTrainingsDone(int item) => trainingsDone.remove(item);
  void removeAtIndexFromTrainingsDone(int index) =>
      trainingsDone.removeAt(index);
  void insertAtIndexInTrainingsDone(int index, int item) =>
      trainingsDone.insert(index, item);
  void updateTrainingsDoneAtIndex(int index, Function(int) updateFn) =>
      trainingsDone[index] = updateFn(trainingsDone[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

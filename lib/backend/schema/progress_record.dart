import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgressRecord extends FirestoreRecord {
  ProgressRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "beginner_progress" field.
  int? _beginnerProgress;
  int get beginnerProgress => _beginnerProgress ?? 0;
  bool hasBeginnerProgress() => _beginnerProgress != null;

  // "advanced_progress" field.
  int? _advancedProgress;
  int get advancedProgress => _advancedProgress ?? 0;
  bool hasAdvancedProgress() => _advancedProgress != null;

  // "expert_progress" field.
  int? _expertProgress;
  int get expertProgress => _expertProgress ?? 0;
  bool hasExpertProgress() => _expertProgress != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "workout_done" field.
  List<WorkoutStatisticStruct>? _workoutDone;
  List<WorkoutStatisticStruct> get workoutDone => _workoutDone ?? const [];
  bool hasWorkoutDone() => _workoutDone != null;

  // "season_done" field.
  List<SeasonStatisticStruct>? _seasonDone;
  List<SeasonStatisticStruct> get seasonDone => _seasonDone ?? const [];
  bool hasSeasonDone() => _seasonDone != null;

  void _initializeFields() {
    _beginnerProgress = castToType<int>(snapshotData['beginner_progress']);
    _advancedProgress = castToType<int>(snapshotData['advanced_progress']);
    _expertProgress = castToType<int>(snapshotData['expert_progress']);
    _user = snapshotData['user'] as DocumentReference?;
    _workoutDone = getStructList(
      snapshotData['workout_done'],
      WorkoutStatisticStruct.fromMap,
    );
    _seasonDone = getStructList(
      snapshotData['season_done'],
      SeasonStatisticStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('progress');

  static Stream<ProgressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProgressRecord.fromSnapshot(s));

  static Future<ProgressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProgressRecord.fromSnapshot(s));

  static ProgressRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProgressRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProgressRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProgressRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProgressRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProgressRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProgressRecordData({
  int? beginnerProgress,
  int? advancedProgress,
  int? expertProgress,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'beginner_progress': beginnerProgress,
      'advanced_progress': advancedProgress,
      'expert_progress': expertProgress,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProgressRecordDocumentEquality implements Equality<ProgressRecord> {
  const ProgressRecordDocumentEquality();

  @override
  bool equals(ProgressRecord? e1, ProgressRecord? e2) {
    const listEquality = ListEquality();
    return e1?.beginnerProgress == e2?.beginnerProgress &&
        e1?.advancedProgress == e2?.advancedProgress &&
        e1?.expertProgress == e2?.expertProgress &&
        e1?.user == e2?.user &&
        listEquality.equals(e1?.workoutDone, e2?.workoutDone) &&
        listEquality.equals(e1?.seasonDone, e2?.seasonDone);
  }

  @override
  int hash(ProgressRecord? e) => const ListEquality().hash([
        e?.beginnerProgress,
        e?.advancedProgress,
        e?.expertProgress,
        e?.user,
        e?.workoutDone,
        e?.seasonDone
      ]);

  @override
  bool isValidKey(Object? o) => o is ProgressRecord;
}

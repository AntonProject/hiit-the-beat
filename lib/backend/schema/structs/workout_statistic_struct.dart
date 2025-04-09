// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class WorkoutStatisticStruct extends FFFirebaseStruct {
  WorkoutStatisticStruct({
    String? seasonId,
    int? level,
    DateTime? datetime,
    int? warpmupPoints,
    int? cooldownPoints,
    int? workoutPoints,
    String? workoutId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _seasonId = seasonId,
        _level = level,
        _datetime = datetime,
        _warpmupPoints = warpmupPoints,
        _cooldownPoints = cooldownPoints,
        _workoutPoints = workoutPoints,
        _workoutId = workoutId,
        super(firestoreUtilData);

  // "seasonId" field.
  String? _seasonId;
  String get seasonId => _seasonId ?? '';
  set seasonId(String? val) => _seasonId = val;

  bool hasSeasonId() => _seasonId != null;

  // "level" field.
  int? _level;
  int get level => _level ?? 1;
  set level(int? val) => _level = val;

  void incrementLevel(int amount) => level = level + amount;

  bool hasLevel() => _level != null;

  // "datetime" field.
  DateTime? _datetime;
  DateTime? get datetime => _datetime;
  set datetime(DateTime? val) => _datetime = val;

  bool hasDatetime() => _datetime != null;

  // "warpmupPoints" field.
  int? _warpmupPoints;
  int get warpmupPoints => _warpmupPoints ?? 0;
  set warpmupPoints(int? val) => _warpmupPoints = val;

  void incrementWarpmupPoints(int amount) =>
      warpmupPoints = warpmupPoints + amount;

  bool hasWarpmupPoints() => _warpmupPoints != null;

  // "cooldownPoints" field.
  int? _cooldownPoints;
  int get cooldownPoints => _cooldownPoints ?? 0;
  set cooldownPoints(int? val) => _cooldownPoints = val;

  void incrementCooldownPoints(int amount) =>
      cooldownPoints = cooldownPoints + amount;

  bool hasCooldownPoints() => _cooldownPoints != null;

  // "workoutPoints" field.
  int? _workoutPoints;
  int get workoutPoints => _workoutPoints ?? 0;
  set workoutPoints(int? val) => _workoutPoints = val;

  void incrementWorkoutPoints(int amount) =>
      workoutPoints = workoutPoints + amount;

  bool hasWorkoutPoints() => _workoutPoints != null;

  // "workoutId" field.
  String? _workoutId;
  String get workoutId => _workoutId ?? '';
  set workoutId(String? val) => _workoutId = val;

  bool hasWorkoutId() => _workoutId != null;

  static WorkoutStatisticStruct fromMap(Map<String, dynamic> data) =>
      WorkoutStatisticStruct(
        seasonId: data['seasonId'] as String?,
        level: castToType<int>(data['level']),
        datetime: data['datetime'] as DateTime?,
        warpmupPoints: castToType<int>(data['warpmupPoints']),
        cooldownPoints: castToType<int>(data['cooldownPoints']),
        workoutPoints: castToType<int>(data['workoutPoints']),
        workoutId: data['workoutId'] as String?,
      );

  static WorkoutStatisticStruct? maybeFromMap(dynamic data) => data is Map
      ? WorkoutStatisticStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'seasonId': _seasonId,
        'level': _level,
        'datetime': _datetime,
        'warpmupPoints': _warpmupPoints,
        'cooldownPoints': _cooldownPoints,
        'workoutPoints': _workoutPoints,
        'workoutId': _workoutId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'seasonId': serializeParam(
          _seasonId,
          ParamType.String,
        ),
        'level': serializeParam(
          _level,
          ParamType.int,
        ),
        'datetime': serializeParam(
          _datetime,
          ParamType.DateTime,
        ),
        'warpmupPoints': serializeParam(
          _warpmupPoints,
          ParamType.int,
        ),
        'cooldownPoints': serializeParam(
          _cooldownPoints,
          ParamType.int,
        ),
        'workoutPoints': serializeParam(
          _workoutPoints,
          ParamType.int,
        ),
        'workoutId': serializeParam(
          _workoutId,
          ParamType.String,
        ),
      }.withoutNulls;

  static WorkoutStatisticStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WorkoutStatisticStruct(
        seasonId: deserializeParam(
          data['seasonId'],
          ParamType.String,
          false,
        ),
        level: deserializeParam(
          data['level'],
          ParamType.int,
          false,
        ),
        datetime: deserializeParam(
          data['datetime'],
          ParamType.DateTime,
          false,
        ),
        warpmupPoints: deserializeParam(
          data['warpmupPoints'],
          ParamType.int,
          false,
        ),
        cooldownPoints: deserializeParam(
          data['cooldownPoints'],
          ParamType.int,
          false,
        ),
        workoutPoints: deserializeParam(
          data['workoutPoints'],
          ParamType.int,
          false,
        ),
        workoutId: deserializeParam(
          data['workoutId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WorkoutStatisticStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WorkoutStatisticStruct &&
        seasonId == other.seasonId &&
        level == other.level &&
        datetime == other.datetime &&
        warpmupPoints == other.warpmupPoints &&
        cooldownPoints == other.cooldownPoints &&
        workoutPoints == other.workoutPoints &&
        workoutId == other.workoutId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        seasonId,
        level,
        datetime,
        warpmupPoints,
        cooldownPoints,
        workoutPoints,
        workoutId
      ]);
}

WorkoutStatisticStruct createWorkoutStatisticStruct({
  String? seasonId,
  int? level,
  DateTime? datetime,
  int? warpmupPoints,
  int? cooldownPoints,
  int? workoutPoints,
  String? workoutId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkoutStatisticStruct(
      seasonId: seasonId,
      level: level,
      datetime: datetime,
      warpmupPoints: warpmupPoints,
      cooldownPoints: cooldownPoints,
      workoutPoints: workoutPoints,
      workoutId: workoutId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WorkoutStatisticStruct? updateWorkoutStatisticStruct(
  WorkoutStatisticStruct? workoutStatistic, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    workoutStatistic
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWorkoutStatisticStructData(
  Map<String, dynamic> firestoreData,
  WorkoutStatisticStruct? workoutStatistic,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workoutStatistic == null) {
    return;
  }
  if (workoutStatistic.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && workoutStatistic.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workoutStatisticData =
      getWorkoutStatisticFirestoreData(workoutStatistic, forFieldValue);
  final nestedData =
      workoutStatisticData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = workoutStatistic.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWorkoutStatisticFirestoreData(
  WorkoutStatisticStruct? workoutStatistic, [
  bool forFieldValue = false,
]) {
  if (workoutStatistic == null) {
    return {};
  }
  final firestoreData = mapToFirestore(workoutStatistic.toMap());

  // Add any Firestore field values
  workoutStatistic.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkoutStatisticListFirestoreData(
  List<WorkoutStatisticStruct>? workoutStatistics,
) =>
    workoutStatistics
        ?.map((e) => getWorkoutStatisticFirestoreData(e, true))
        .toList() ??
    [];

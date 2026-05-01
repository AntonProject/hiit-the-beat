// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SeasonStatisticStruct extends FFFirebaseStruct {
  SeasonStatisticStruct({
    int? seasonNumber,
    DateTime? datetime,
    int? seasonLevel,
    String? seasonId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _seasonNumber = seasonNumber,
        _datetime = datetime,
        _seasonLevel = seasonLevel,
        _seasonId = seasonId,
        super(firestoreUtilData);

  // "seasonNumber" field.
  int? _seasonNumber;
  int get seasonNumber => _seasonNumber ?? 1;
  set seasonNumber(int? val) => _seasonNumber = val;

  void incrementSeasonNumber(int amount) =>
      seasonNumber = seasonNumber + amount;

  bool hasSeasonNumber() => _seasonNumber != null;

  // "datetime" field.
  DateTime? _datetime;
  DateTime? get datetime => _datetime;
  set datetime(DateTime? val) => _datetime = val;

  bool hasDatetime() => _datetime != null;

  // "seasonLevel" field.
  int? _seasonLevel;
  int get seasonLevel => _seasonLevel ?? 1;
  set seasonLevel(int? val) => _seasonLevel = val;

  void incrementSeasonLevel(int amount) => seasonLevel = seasonLevel + amount;

  bool hasSeasonLevel() => _seasonLevel != null;

  // "seasonId" field.
  String? _seasonId;
  String get seasonId => _seasonId ?? '';
  set seasonId(String? val) => _seasonId = val;

  bool hasSeasonId() => _seasonId != null;

  static SeasonStatisticStruct fromMap(Map<String, dynamic> data) =>
      SeasonStatisticStruct(
        seasonNumber: castToType<int>(data['seasonNumber']),
        datetime: data['datetime'] as DateTime?,
        seasonLevel: castToType<int>(data['seasonLevel']),
        seasonId: data['seasonId'] as String?,
      );

  static SeasonStatisticStruct? maybeFromMap(dynamic data) => data is Map
      ? SeasonStatisticStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'seasonNumber': _seasonNumber,
        'datetime': _datetime,
        'seasonLevel': _seasonLevel,
        'seasonId': _seasonId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'seasonNumber': serializeParam(
          _seasonNumber,
          ParamType.int,
        ),
        'datetime': serializeParam(
          _datetime,
          ParamType.DateTime,
        ),
        'seasonLevel': serializeParam(
          _seasonLevel,
          ParamType.int,
        ),
        'seasonId': serializeParam(
          _seasonId,
          ParamType.String,
        ),
      }.withoutNulls;

  static SeasonStatisticStruct fromSerializableMap(Map<String, dynamic> data) =>
      SeasonStatisticStruct(
        seasonNumber: deserializeParam(
          data['seasonNumber'],
          ParamType.int,
          false,
        ),
        datetime: deserializeParam(
          data['datetime'],
          ParamType.DateTime,
          false,
        ),
        seasonLevel: deserializeParam(
          data['seasonLevel'],
          ParamType.int,
          false,
        ),
        seasonId: deserializeParam(
          data['seasonId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SeasonStatisticStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SeasonStatisticStruct &&
        seasonNumber == other.seasonNumber &&
        datetime == other.datetime &&
        seasonLevel == other.seasonLevel &&
        seasonId == other.seasonId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([seasonNumber, datetime, seasonLevel, seasonId]);
}

SeasonStatisticStruct createSeasonStatisticStruct({
  int? seasonNumber,
  DateTime? datetime,
  int? seasonLevel,
  String? seasonId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SeasonStatisticStruct(
      seasonNumber: seasonNumber,
      datetime: datetime,
      seasonLevel: seasonLevel,
      seasonId: seasonId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SeasonStatisticStruct? updateSeasonStatisticStruct(
  SeasonStatisticStruct? seasonStatistic, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    seasonStatistic
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSeasonStatisticStructData(
  Map<String, dynamic> firestoreData,
  SeasonStatisticStruct? seasonStatistic,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (seasonStatistic == null) {
    return;
  }
  if (seasonStatistic.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && seasonStatistic.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final seasonStatisticData =
      getSeasonStatisticFirestoreData(seasonStatistic, forFieldValue);
  final nestedData =
      seasonStatisticData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = seasonStatistic.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSeasonStatisticFirestoreData(
  SeasonStatisticStruct? seasonStatistic, [
  bool forFieldValue = false,
]) {
  if (seasonStatistic == null) {
    return {};
  }
  final firestoreData = mapToFirestore(seasonStatistic.toMap());

  // Add any Firestore field values
  mapToFirestore(seasonStatistic.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSeasonStatisticListFirestoreData(
  List<SeasonStatisticStruct>? seasonStatistics,
) =>
    seasonStatistics
        ?.map((e) => getSeasonStatisticFirestoreData(e, true))
        .toList() ??
    [];

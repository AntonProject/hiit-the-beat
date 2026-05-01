// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserLevelStruct extends FFFirebaseStruct {
  UserLevelStruct({
    int? levelNumber,
    String? levenName,
    int? points,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _levelNumber = levelNumber,
        _levenName = levenName,
        _points = points,
        super(firestoreUtilData);

  // "levelNumber" field.
  int? _levelNumber;
  int get levelNumber => _levelNumber ?? 1;
  set levelNumber(int? val) => _levelNumber = val;

  void incrementLevelNumber(int amount) => levelNumber = levelNumber + amount;

  bool hasLevelNumber() => _levelNumber != null;

  // "levenName" field.
  String? _levenName;
  String get levenName => _levenName ?? 'Newbie';
  set levenName(String? val) => _levenName = val;

  bool hasLevenName() => _levenName != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  set points(int? val) => _points = val;

  void incrementPoints(int amount) => points = points + amount;

  bool hasPoints() => _points != null;

  static UserLevelStruct fromMap(Map<String, dynamic> data) => UserLevelStruct(
        levelNumber: castToType<int>(data['levelNumber']),
        levenName: data['levenName'] as String?,
        points: castToType<int>(data['points']),
      );

  static UserLevelStruct? maybeFromMap(dynamic data) => data is Map
      ? UserLevelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'levelNumber': _levelNumber,
        'levenName': _levenName,
        'points': _points,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'levelNumber': serializeParam(
          _levelNumber,
          ParamType.int,
        ),
        'levenName': serializeParam(
          _levenName,
          ParamType.String,
        ),
        'points': serializeParam(
          _points,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserLevelStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserLevelStruct(
        levelNumber: deserializeParam(
          data['levelNumber'],
          ParamType.int,
          false,
        ),
        levenName: deserializeParam(
          data['levenName'],
          ParamType.String,
          false,
        ),
        points: deserializeParam(
          data['points'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserLevelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserLevelStruct &&
        levelNumber == other.levelNumber &&
        levenName == other.levenName &&
        points == other.points;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([levelNumber, levenName, points]);
}

UserLevelStruct createUserLevelStruct({
  int? levelNumber,
  String? levenName,
  int? points,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserLevelStruct(
      levelNumber: levelNumber,
      levenName: levenName,
      points: points,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserLevelStruct? updateUserLevelStruct(
  UserLevelStruct? userLevel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userLevel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserLevelStructData(
  Map<String, dynamic> firestoreData,
  UserLevelStruct? userLevel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userLevel == null) {
    return;
  }
  if (userLevel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userLevel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userLevelData = getUserLevelFirestoreData(userLevel, forFieldValue);
  final nestedData = userLevelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userLevel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserLevelFirestoreData(
  UserLevelStruct? userLevel, [
  bool forFieldValue = false,
]) {
  if (userLevel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userLevel.toMap());

  // Add any Firestore field values
  mapToFirestore(userLevel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserLevelListFirestoreData(
  List<UserLevelStruct>? userLevels,
) =>
    userLevels?.map((e) => getUserLevelFirestoreData(e, true)).toList() ?? [];

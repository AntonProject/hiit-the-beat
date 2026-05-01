// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LevelStruct extends FFFirebaseStruct {
  LevelStruct({
    int? number,
    String? titleEn,
    String? titleDe,
    String? titleJa,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _number = number,
        _titleEn = titleEn,
        _titleDe = titleDe,
        _titleJa = titleJa,
        super(firestoreUtilData);

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;

  void incrementNumber(int amount) => number = number + amount;

  bool hasNumber() => _number != null;

  // "title_en" field.
  String? _titleEn;
  String get titleEn => _titleEn ?? '';
  set titleEn(String? val) => _titleEn = val;

  bool hasTitleEn() => _titleEn != null;

  // "title_de" field.
  String? _titleDe;
  String get titleDe => _titleDe ?? '';
  set titleDe(String? val) => _titleDe = val;

  bool hasTitleDe() => _titleDe != null;

  // "title_ja" field.
  String? _titleJa;
  String get titleJa => _titleJa ?? '';
  set titleJa(String? val) => _titleJa = val;

  bool hasTitleJa() => _titleJa != null;

  static LevelStruct fromMap(Map<String, dynamic> data) => LevelStruct(
        number: castToType<int>(data['number']),
        titleEn: data['title_en'] as String?,
        titleDe: data['title_de'] as String?,
        titleJa: data['title_ja'] as String?,
      );

  static LevelStruct? maybeFromMap(dynamic data) =>
      data is Map ? LevelStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'number': _number,
        'title_en': _titleEn,
        'title_de': _titleDe,
        'title_ja': _titleJa,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
        'title_en': serializeParam(
          _titleEn,
          ParamType.String,
        ),
        'title_de': serializeParam(
          _titleDe,
          ParamType.String,
        ),
        'title_ja': serializeParam(
          _titleJa,
          ParamType.String,
        ),
      }.withoutNulls;

  static LevelStruct fromSerializableMap(Map<String, dynamic> data) =>
      LevelStruct(
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
        titleEn: deserializeParam(
          data['title_en'],
          ParamType.String,
          false,
        ),
        titleDe: deserializeParam(
          data['title_de'],
          ParamType.String,
          false,
        ),
        titleJa: deserializeParam(
          data['title_ja'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LevelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LevelStruct &&
        number == other.number &&
        titleEn == other.titleEn &&
        titleDe == other.titleDe &&
        titleJa == other.titleJa;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([number, titleEn, titleDe, titleJa]);
}

LevelStruct createLevelStruct({
  int? number,
  String? titleEn,
  String? titleDe,
  String? titleJa,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LevelStruct(
      number: number,
      titleEn: titleEn,
      titleDe: titleDe,
      titleJa: titleJa,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LevelStruct? updateLevelStruct(
  LevelStruct? level, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    level
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLevelStructData(
  Map<String, dynamic> firestoreData,
  LevelStruct? level,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (level == null) {
    return;
  }
  if (level.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && level.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final levelData = getLevelFirestoreData(level, forFieldValue);
  final nestedData = levelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = level.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLevelFirestoreData(
  LevelStruct? level, [
  bool forFieldValue = false,
]) {
  if (level == null) {
    return {};
  }
  final firestoreData = mapToFirestore(level.toMap());

  // Add any Firestore field values
  mapToFirestore(level.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLevelListFirestoreData(
  List<LevelStruct>? levels,
) =>
    levels?.map((e) => getLevelFirestoreData(e, true)).toList() ?? [];

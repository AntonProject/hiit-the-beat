// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LinksStruct extends FFFirebaseStruct {
  LinksStruct({
    String? tag,
    String? contact,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tag = tag,
        _contact = contact,
        super(firestoreUtilData);

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  set tag(String? val) => _tag = val;

  bool hasTag() => _tag != null;

  // "contact" field.
  String? _contact;
  String get contact => _contact ?? '';
  set contact(String? val) => _contact = val;

  bool hasContact() => _contact != null;

  static LinksStruct fromMap(Map<String, dynamic> data) => LinksStruct(
        tag: data['tag'] as String?,
        contact: data['contact'] as String?,
      );

  static LinksStruct? maybeFromMap(dynamic data) =>
      data is Map ? LinksStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'tag': _tag,
        'contact': _contact,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tag': serializeParam(
          _tag,
          ParamType.String,
        ),
        'contact': serializeParam(
          _contact,
          ParamType.String,
        ),
      }.withoutNulls;

  static LinksStruct fromSerializableMap(Map<String, dynamic> data) =>
      LinksStruct(
        tag: deserializeParam(
          data['tag'],
          ParamType.String,
          false,
        ),
        contact: deserializeParam(
          data['contact'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LinksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LinksStruct && tag == other.tag && contact == other.contact;
  }

  @override
  int get hashCode => const ListEquality().hash([tag, contact]);
}

LinksStruct createLinksStruct({
  String? tag,
  String? contact,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LinksStruct(
      tag: tag,
      contact: contact,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LinksStruct? updateLinksStruct(
  LinksStruct? links, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    links
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLinksStructData(
  Map<String, dynamic> firestoreData,
  LinksStruct? links,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (links == null) {
    return;
  }
  if (links.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && links.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final linksData = getLinksFirestoreData(links, forFieldValue);
  final nestedData = linksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = links.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLinksFirestoreData(
  LinksStruct? links, [
  bool forFieldValue = false,
]) {
  if (links == null) {
    return {};
  }
  final firestoreData = mapToFirestore(links.toMap());

  // Add any Firestore field values
  mapToFirestore(links.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLinksListFirestoreData(
  List<LinksStruct>? linkss,
) =>
    linkss?.map((e) => getLinksFirestoreData(e, true)).toList() ?? [];

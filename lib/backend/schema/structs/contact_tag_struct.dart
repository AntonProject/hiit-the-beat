// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactTagStruct extends FFFirebaseStruct {
  ContactTagStruct({
    String? contact,
    String? tag,
    String? cdate,
    String? createdTimestamp,
    String? updatedTimestamp,
    String? createdBy,
    String? updatedBy,
    LinksStruct? links,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _contact = contact,
        _tag = tag,
        _cdate = cdate,
        _createdTimestamp = createdTimestamp,
        _updatedTimestamp = updatedTimestamp,
        _createdBy = createdBy,
        _updatedBy = updatedBy,
        _links = links,
        _id = id,
        super(firestoreUtilData);

  // "contact" field.
  String? _contact;
  String get contact => _contact ?? '';
  set contact(String? val) => _contact = val;

  bool hasContact() => _contact != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  set tag(String? val) => _tag = val;

  bool hasTag() => _tag != null;

  // "cdate" field.
  String? _cdate;
  String get cdate => _cdate ?? '';
  set cdate(String? val) => _cdate = val;

  bool hasCdate() => _cdate != null;

  // "created_timestamp" field.
  String? _createdTimestamp;
  String get createdTimestamp => _createdTimestamp ?? '';
  set createdTimestamp(String? val) => _createdTimestamp = val;

  bool hasCreatedTimestamp() => _createdTimestamp != null;

  // "updated_timestamp" field.
  String? _updatedTimestamp;
  String get updatedTimestamp => _updatedTimestamp ?? '';
  set updatedTimestamp(String? val) => _updatedTimestamp = val;

  bool hasUpdatedTimestamp() => _updatedTimestamp != null;

  // "created_by" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  set createdBy(String? val) => _createdBy = val;

  bool hasCreatedBy() => _createdBy != null;

  // "updated_by" field.
  String? _updatedBy;
  String get updatedBy => _updatedBy ?? '';
  set updatedBy(String? val) => _updatedBy = val;

  bool hasUpdatedBy() => _updatedBy != null;

  // "links" field.
  LinksStruct? _links;
  LinksStruct get links => _links ?? LinksStruct();
  set links(LinksStruct? val) => _links = val;

  void updateLinks(Function(LinksStruct) updateFn) {
    updateFn(_links ??= LinksStruct());
  }

  bool hasLinks() => _links != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static ContactTagStruct fromMap(Map<String, dynamic> data) =>
      ContactTagStruct(
        contact: data['contact'] as String?,
        tag: data['tag'] as String?,
        cdate: data['cdate'] as String?,
        createdTimestamp: data['created_timestamp'] as String?,
        updatedTimestamp: data['updated_timestamp'] as String?,
        createdBy: data['created_by'] as String?,
        updatedBy: data['updated_by'] as String?,
        links: data['links'] is LinksStruct
            ? data['links']
            : LinksStruct.maybeFromMap(data['links']),
        id: data['id'] as String?,
      );

  static ContactTagStruct? maybeFromMap(dynamic data) => data is Map
      ? ContactTagStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'contact': _contact,
        'tag': _tag,
        'cdate': _cdate,
        'created_timestamp': _createdTimestamp,
        'updated_timestamp': _updatedTimestamp,
        'created_by': _createdBy,
        'updated_by': _updatedBy,
        'links': _links?.toMap(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'contact': serializeParam(
          _contact,
          ParamType.String,
        ),
        'tag': serializeParam(
          _tag,
          ParamType.String,
        ),
        'cdate': serializeParam(
          _cdate,
          ParamType.String,
        ),
        'created_timestamp': serializeParam(
          _createdTimestamp,
          ParamType.String,
        ),
        'updated_timestamp': serializeParam(
          _updatedTimestamp,
          ParamType.String,
        ),
        'created_by': serializeParam(
          _createdBy,
          ParamType.String,
        ),
        'updated_by': serializeParam(
          _updatedBy,
          ParamType.String,
        ),
        'links': serializeParam(
          _links,
          ParamType.DataStruct,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContactTagStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContactTagStruct(
        contact: deserializeParam(
          data['contact'],
          ParamType.String,
          false,
        ),
        tag: deserializeParam(
          data['tag'],
          ParamType.String,
          false,
        ),
        cdate: deserializeParam(
          data['cdate'],
          ParamType.String,
          false,
        ),
        createdTimestamp: deserializeParam(
          data['created_timestamp'],
          ParamType.String,
          false,
        ),
        updatedTimestamp: deserializeParam(
          data['updated_timestamp'],
          ParamType.String,
          false,
        ),
        createdBy: deserializeParam(
          data['created_by'],
          ParamType.String,
          false,
        ),
        updatedBy: deserializeParam(
          data['updated_by'],
          ParamType.String,
          false,
        ),
        links: deserializeStructParam(
          data['links'],
          ParamType.DataStruct,
          false,
          structBuilder: LinksStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ContactTagStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContactTagStruct &&
        contact == other.contact &&
        tag == other.tag &&
        cdate == other.cdate &&
        createdTimestamp == other.createdTimestamp &&
        updatedTimestamp == other.updatedTimestamp &&
        createdBy == other.createdBy &&
        updatedBy == other.updatedBy &&
        links == other.links &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([
        contact,
        tag,
        cdate,
        createdTimestamp,
        updatedTimestamp,
        createdBy,
        updatedBy,
        links,
        id
      ]);
}

ContactTagStruct createContactTagStruct({
  String? contact,
  String? tag,
  String? cdate,
  String? createdTimestamp,
  String? updatedTimestamp,
  String? createdBy,
  String? updatedBy,
  LinksStruct? links,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContactTagStruct(
      contact: contact,
      tag: tag,
      cdate: cdate,
      createdTimestamp: createdTimestamp,
      updatedTimestamp: updatedTimestamp,
      createdBy: createdBy,
      updatedBy: updatedBy,
      links: links ?? (clearUnsetFields ? LinksStruct() : null),
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContactTagStruct? updateContactTagStruct(
  ContactTagStruct? contactTag, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contactTag
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContactTagStructData(
  Map<String, dynamic> firestoreData,
  ContactTagStruct? contactTag,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contactTag == null) {
    return;
  }
  if (contactTag.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contactTag.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contactTagData = getContactTagFirestoreData(contactTag, forFieldValue);
  final nestedData = contactTagData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contactTag.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContactTagFirestoreData(
  ContactTagStruct? contactTag, [
  bool forFieldValue = false,
]) {
  if (contactTag == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contactTag.toMap());

  // Handle nested data for "links" field.
  addLinksStructData(
    firestoreData,
    contactTag.hasLinks() ? contactTag.links : null,
    'links',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(contactTag.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContactTagListFirestoreData(
  List<ContactTagStruct>? contactTags,
) =>
    contactTags?.map((e) => getContactTagFirestoreData(e, true)).toList() ?? [];

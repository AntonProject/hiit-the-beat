import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromoRecord extends FirestoreRecord {
  PromoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "text_en" field.
  String? _textEn;
  String get textEn => _textEn ?? '';
  bool hasTextEn() => _textEn != null;

  // "text_de" field.
  String? _textDe;
  String get textDe => _textDe ?? '';
  bool hasTextDe() => _textDe != null;

  // "show" field.
  bool? _show;
  bool get show => _show ?? false;
  bool hasShow() => _show != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "linkURL" field.
  String? _linkURL;
  String get linkURL => _linkURL ?? '';
  bool hasLinkURL() => _linkURL != null;

  void _initializeFields() {
    _textEn = snapshotData['text_en'] as String?;
    _textDe = snapshotData['text_de'] as String?;
    _show = snapshotData['show'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _linkURL = snapshotData['linkURL'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promo');

  static Stream<PromoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromoRecord.fromSnapshot(s));

  static Future<PromoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromoRecord.fromSnapshot(s));

  static PromoRecord fromSnapshot(DocumentSnapshot snapshot) => PromoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromoRecordData({
  String? textEn,
  String? textDe,
  bool? show,
  DateTime? createdAt,
  String? linkURL,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text_en': textEn,
      'text_de': textDe,
      'show': show,
      'created_at': createdAt,
      'linkURL': linkURL,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromoRecordDocumentEquality implements Equality<PromoRecord> {
  const PromoRecordDocumentEquality();

  @override
  bool equals(PromoRecord? e1, PromoRecord? e2) {
    return e1?.textEn == e2?.textEn &&
        e1?.textDe == e2?.textDe &&
        e1?.show == e2?.show &&
        e1?.createdAt == e2?.createdAt &&
        e1?.linkURL == e2?.linkURL;
  }

  @override
  int hash(PromoRecord? e) => const ListEquality()
      .hash([e?.textEn, e?.textDe, e?.show, e?.createdAt, e?.linkURL]);

  @override
  bool isValidKey(Object? o) => o is PromoRecord;
}

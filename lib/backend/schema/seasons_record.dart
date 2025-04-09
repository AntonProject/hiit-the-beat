import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SeasonsRecord extends FirestoreRecord {
  SeasonsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "released_at" field.
  DateTime? _releasedAt;
  DateTime? get releasedAt => _releasedAt;
  bool hasReleasedAt() => _releasedAt != null;

  // "en" field.
  bool? _en;
  bool get en => _en ?? false;
  bool hasEn() => _en != null;

  // "de" field.
  bool? _de;
  bool get de => _de ?? false;
  bool hasDe() => _de != null;

  // "cover" field.
  String? _cover;
  String get cover => _cover ?? '';
  bool hasCover() => _cover != null;

  // "level" field.
  int? _level;
  int get level => _level ?? 0;
  bool hasLevel() => _level != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "duration_de" field.
  String? _durationDe;
  String get durationDe => _durationDe ?? '';
  bool hasDurationDe() => _durationDe != null;

  // "title_en" field.
  String? _titleEn;
  String get titleEn => _titleEn ?? '';
  bool hasTitleEn() => _titleEn != null;

  // "title_de" field.
  String? _titleDe;
  String get titleDe => _titleDe ?? '';
  bool hasTitleDe() => _titleDe != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _releasedAt = snapshotData['released_at'] as DateTime?;
    _en = snapshotData['en'] as bool?;
    _de = snapshotData['de'] as bool?;
    _cover = snapshotData['cover'] as String?;
    _level = castToType<int>(snapshotData['level']);
    _duration = snapshotData['duration'] as String?;
    _durationDe = snapshotData['duration_de'] as String?;
    _titleEn = snapshotData['title_en'] as String?;
    _titleDe = snapshotData['title_de'] as String?;
    _number = castToType<int>(snapshotData['number']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('seasons');

  static Stream<SeasonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SeasonsRecord.fromSnapshot(s));

  static Future<SeasonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SeasonsRecord.fromSnapshot(s));

  static SeasonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SeasonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SeasonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SeasonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SeasonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SeasonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSeasonsRecordData({
  DateTime? createdAt,
  DateTime? releasedAt,
  bool? en,
  bool? de,
  String? cover,
  int? level,
  String? duration,
  String? durationDe,
  String? titleEn,
  String? titleDe,
  int? number,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'released_at': releasedAt,
      'en': en,
      'de': de,
      'cover': cover,
      'level': level,
      'duration': duration,
      'duration_de': durationDe,
      'title_en': titleEn,
      'title_de': titleDe,
      'number': number,
    }.withoutNulls,
  );

  return firestoreData;
}

class SeasonsRecordDocumentEquality implements Equality<SeasonsRecord> {
  const SeasonsRecordDocumentEquality();

  @override
  bool equals(SeasonsRecord? e1, SeasonsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.releasedAt == e2?.releasedAt &&
        e1?.en == e2?.en &&
        e1?.de == e2?.de &&
        e1?.cover == e2?.cover &&
        e1?.level == e2?.level &&
        e1?.duration == e2?.duration &&
        e1?.durationDe == e2?.durationDe &&
        e1?.titleEn == e2?.titleEn &&
        e1?.titleDe == e2?.titleDe &&
        e1?.number == e2?.number;
  }

  @override
  int hash(SeasonsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.releasedAt,
        e?.en,
        e?.de,
        e?.cover,
        e?.level,
        e?.duration,
        e?.durationDe,
        e?.titleEn,
        e?.titleDe,
        e?.number
      ]);

  @override
  bool isValidKey(Object? o) => o is SeasonsRecord;
}

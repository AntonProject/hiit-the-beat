import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdditionalsRecord extends FirestoreRecord {
  AdditionalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cover" field.
  String? _cover;
  String get cover => _cover ?? '';
  bool hasCover() => _cover != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  bool hasViews() => _views != null;

  // "title_en" field.
  String? _titleEn;
  String get titleEn => _titleEn ?? '';
  bool hasTitleEn() => _titleEn != null;

  // "title_de" field.
  String? _titleDe;
  String get titleDe => _titleDe ?? '';
  bool hasTitleDe() => _titleDe != null;

  // "type_index" field.
  int? _typeIndex;
  int get typeIndex => _typeIndex ?? 0;
  bool hasTypeIndex() => _typeIndex != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "video_url_en" field.
  String? _videoUrlEn;
  String get videoUrlEn => _videoUrlEn ?? '';
  bool hasVideoUrlEn() => _videoUrlEn != null;

  // "video_url_de" field.
  String? _videoUrlDe;
  String get videoUrlDe => _videoUrlDe ?? '';
  bool hasVideoUrlDe() => _videoUrlDe != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  bool hasPoints() => _points != null;

  // "linkURL" field.
  String? _linkURL;
  String get linkURL => _linkURL ?? '';
  bool hasLinkURL() => _linkURL != null;

  // "desc_en" field.
  String? _descEn;
  String get descEn => _descEn ?? '';
  bool hasDescEn() => _descEn != null;

  // "desc_de" field.
  String? _descDe;
  String get descDe => _descDe ?? '';
  bool hasDescDe() => _descDe != null;

  // "datetime" field.
  DateTime? _datetime;
  DateTime? get datetime => _datetime;
  bool hasDatetime() => _datetime != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "duration_de" field.
  String? _durationDe;
  String get durationDe => _durationDe ?? '';
  bool hasDurationDe() => _durationDe != null;

  // "free" field.
  bool? _free;
  bool get free => _free ?? false;
  bool hasFree() => _free != null;

  // "en" field.
  bool? _en;
  bool get en => _en ?? false;
  bool hasEn() => _en != null;

  // "de" field.
  bool? _de;
  bool get de => _de ?? false;
  bool hasDe() => _de != null;

  void _initializeFields() {
    _cover = snapshotData['cover'] as String?;
    _views = castToType<int>(snapshotData['views']);
    _titleEn = snapshotData['title_en'] as String?;
    _titleDe = snapshotData['title_de'] as String?;
    _typeIndex = castToType<int>(snapshotData['type_index']);
    _index = castToType<int>(snapshotData['index']);
    _videoUrlEn = snapshotData['video_url_en'] as String?;
    _videoUrlDe = snapshotData['video_url_de'] as String?;
    _points = castToType<int>(snapshotData['points']);
    _linkURL = snapshotData['linkURL'] as String?;
    _descEn = snapshotData['desc_en'] as String?;
    _descDe = snapshotData['desc_de'] as String?;
    _datetime = snapshotData['datetime'] as DateTime?;
    _duration = snapshotData['duration'] as String?;
    _durationDe = snapshotData['duration_de'] as String?;
    _free = snapshotData['free'] as bool?;
    _en = snapshotData['en'] as bool?;
    _de = snapshotData['de'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('additionals');

  static Stream<AdditionalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdditionalsRecord.fromSnapshot(s));

  static Future<AdditionalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdditionalsRecord.fromSnapshot(s));

  static AdditionalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdditionalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdditionalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdditionalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdditionalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdditionalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdditionalsRecordData({
  String? cover,
  int? views,
  String? titleEn,
  String? titleDe,
  int? typeIndex,
  int? index,
  String? videoUrlEn,
  String? videoUrlDe,
  int? points,
  String? linkURL,
  String? descEn,
  String? descDe,
  DateTime? datetime,
  String? duration,
  String? durationDe,
  bool? free,
  bool? en,
  bool? de,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cover': cover,
      'views': views,
      'title_en': titleEn,
      'title_de': titleDe,
      'type_index': typeIndex,
      'index': index,
      'video_url_en': videoUrlEn,
      'video_url_de': videoUrlDe,
      'points': points,
      'linkURL': linkURL,
      'desc_en': descEn,
      'desc_de': descDe,
      'datetime': datetime,
      'duration': duration,
      'duration_de': durationDe,
      'free': free,
      'en': en,
      'de': de,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdditionalsRecordDocumentEquality implements Equality<AdditionalsRecord> {
  const AdditionalsRecordDocumentEquality();

  @override
  bool equals(AdditionalsRecord? e1, AdditionalsRecord? e2) {
    return e1?.cover == e2?.cover &&
        e1?.views == e2?.views &&
        e1?.titleEn == e2?.titleEn &&
        e1?.titleDe == e2?.titleDe &&
        e1?.typeIndex == e2?.typeIndex &&
        e1?.index == e2?.index &&
        e1?.videoUrlEn == e2?.videoUrlEn &&
        e1?.videoUrlDe == e2?.videoUrlDe &&
        e1?.points == e2?.points &&
        e1?.linkURL == e2?.linkURL &&
        e1?.descEn == e2?.descEn &&
        e1?.descDe == e2?.descDe &&
        e1?.datetime == e2?.datetime &&
        e1?.duration == e2?.duration &&
        e1?.durationDe == e2?.durationDe &&
        e1?.free == e2?.free &&
        e1?.en == e2?.en &&
        e1?.de == e2?.de;
  }

  @override
  int hash(AdditionalsRecord? e) => const ListEquality().hash([
        e?.cover,
        e?.views,
        e?.titleEn,
        e?.titleDe,
        e?.typeIndex,
        e?.index,
        e?.videoUrlEn,
        e?.videoUrlDe,
        e?.points,
        e?.linkURL,
        e?.descEn,
        e?.descDe,
        e?.datetime,
        e?.duration,
        e?.durationDe,
        e?.free,
        e?.en,
        e?.de
      ]);

  @override
  bool isValidKey(Object? o) => o is AdditionalsRecord;
}

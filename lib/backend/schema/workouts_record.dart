import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkoutsRecord extends FirestoreRecord {
  WorkoutsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "video_url_en" field.
  String? _videoUrlEn;
  String get videoUrlEn => _videoUrlEn ?? '';
  bool hasVideoUrlEn() => _videoUrlEn != null;

  // "video_url_de" field.
  String? _videoUrlDe;
  String get videoUrlDe => _videoUrlDe ?? '';
  bool hasVideoUrlDe() => _videoUrlDe != null;

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

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "season_id" field.
  String? _seasonId;
  String get seasonId => _seasonId ?? '';
  bool hasSeasonId() => _seasonId != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  bool hasPoints() => _points != null;

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

  void _initializeFields() {
    _videoUrlEn = snapshotData['video_url_en'] as String?;
    _videoUrlDe = snapshotData['video_url_de'] as String?;
    _cover = snapshotData['cover'] as String?;
    _views = castToType<int>(snapshotData['views']);
    _titleEn = snapshotData['title_en'] as String?;
    _titleDe = snapshotData['title_de'] as String?;
    _index = castToType<int>(snapshotData['index']);
    _seasonId = snapshotData['season_id'] as String?;
    _points = castToType<int>(snapshotData['points']);
    _duration = snapshotData['duration'] as String?;
    _durationDe = snapshotData['duration_de'] as String?;
    _free = snapshotData['free'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('workouts');

  static Stream<WorkoutsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkoutsRecord.fromSnapshot(s));

  static Future<WorkoutsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkoutsRecord.fromSnapshot(s));

  static WorkoutsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkoutsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkoutsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkoutsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkoutsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkoutsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkoutsRecordData({
  String? videoUrlEn,
  String? videoUrlDe,
  String? cover,
  int? views,
  String? titleEn,
  String? titleDe,
  int? index,
  String? seasonId,
  int? points,
  String? duration,
  String? durationDe,
  bool? free,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'video_url_en': videoUrlEn,
      'video_url_de': videoUrlDe,
      'cover': cover,
      'views': views,
      'title_en': titleEn,
      'title_de': titleDe,
      'index': index,
      'season_id': seasonId,
      'points': points,
      'duration': duration,
      'duration_de': durationDe,
      'free': free,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkoutsRecordDocumentEquality implements Equality<WorkoutsRecord> {
  const WorkoutsRecordDocumentEquality();

  @override
  bool equals(WorkoutsRecord? e1, WorkoutsRecord? e2) {
    return e1?.videoUrlEn == e2?.videoUrlEn &&
        e1?.videoUrlDe == e2?.videoUrlDe &&
        e1?.cover == e2?.cover &&
        e1?.views == e2?.views &&
        e1?.titleEn == e2?.titleEn &&
        e1?.titleDe == e2?.titleDe &&
        e1?.index == e2?.index &&
        e1?.seasonId == e2?.seasonId &&
        e1?.points == e2?.points &&
        e1?.duration == e2?.duration &&
        e1?.durationDe == e2?.durationDe &&
        e1?.free == e2?.free;
  }

  @override
  int hash(WorkoutsRecord? e) => const ListEquality().hash([
        e?.videoUrlEn,
        e?.videoUrlDe,
        e?.cover,
        e?.views,
        e?.titleEn,
        e?.titleDe,
        e?.index,
        e?.seasonId,
        e?.points,
        e?.duration,
        e?.durationDe,
        e?.free
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkoutsRecord;
}

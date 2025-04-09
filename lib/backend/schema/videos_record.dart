import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideosRecord extends FirestoreRecord {
  VideosRecord._(
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

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  bool hasViews() => _views != null;

  // "url_en" field.
  String? _urlEn;
  String get urlEn => _urlEn ?? '';
  bool hasUrlEn() => _urlEn != null;

  // "url_de" field.
  String? _urlDe;
  String get urlDe => _urlDe ?? '';
  bool hasUrlDe() => _urlDe != null;

  // "cover_de" field.
  String? _coverDe;
  String get coverDe => _coverDe ?? '';
  bool hasCoverDe() => _coverDe != null;

  void _initializeFields() {
    _videoUrlEn = snapshotData['video_url_en'] as String?;
    _videoUrlDe = snapshotData['video_url_de'] as String?;
    _cover = snapshotData['cover'] as String?;
    _type = snapshotData['type'] as String?;
    _index = castToType<int>(snapshotData['index']);
    _views = castToType<int>(snapshotData['views']);
    _urlEn = snapshotData['url_en'] as String?;
    _urlDe = snapshotData['url_de'] as String?;
    _coverDe = snapshotData['cover_de'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('videos');

  static Stream<VideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideosRecord.fromSnapshot(s));

  static Future<VideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideosRecord.fromSnapshot(s));

  static VideosRecord fromSnapshot(DocumentSnapshot snapshot) => VideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideosRecordData({
  String? videoUrlEn,
  String? videoUrlDe,
  String? cover,
  String? type,
  int? index,
  int? views,
  String? urlEn,
  String? urlDe,
  String? coverDe,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'video_url_en': videoUrlEn,
      'video_url_de': videoUrlDe,
      'cover': cover,
      'type': type,
      'index': index,
      'views': views,
      'url_en': urlEn,
      'url_de': urlDe,
      'cover_de': coverDe,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideosRecordDocumentEquality implements Equality<VideosRecord> {
  const VideosRecordDocumentEquality();

  @override
  bool equals(VideosRecord? e1, VideosRecord? e2) {
    return e1?.videoUrlEn == e2?.videoUrlEn &&
        e1?.videoUrlDe == e2?.videoUrlDe &&
        e1?.cover == e2?.cover &&
        e1?.type == e2?.type &&
        e1?.index == e2?.index &&
        e1?.views == e2?.views &&
        e1?.urlEn == e2?.urlEn &&
        e1?.urlDe == e2?.urlDe &&
        e1?.coverDe == e2?.coverDe;
  }

  @override
  int hash(VideosRecord? e) => const ListEquality().hash([
        e?.videoUrlEn,
        e?.videoUrlDe,
        e?.cover,
        e?.type,
        e?.index,
        e?.views,
        e?.urlEn,
        e?.urlDe,
        e?.coverDe
      ]);

  @override
  bool isValidKey(Object? o) => o is VideosRecord;
}

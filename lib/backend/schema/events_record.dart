import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "isZoom" field.
  bool? _isZoom;
  bool get isZoom => _isZoom ?? false;
  bool hasIsZoom() => _isZoom != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "booking_link" field.
  String? _bookingLink;
  String get bookingLink => _bookingLink ?? '';
  bool hasBookingLink() => _bookingLink != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _isZoom = snapshotData['isZoom'] as bool?;
    _date = snapshotData['date'] as DateTime?;
    _time = snapshotData['time'] as String?;
    _bookingLink = snapshotData['booking_link'] as String?;
    _description = snapshotData['description'] as String?;
    _address = snapshotData['address'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? name,
  bool? isZoom,
  DateTime? date,
  String? time,
  String? bookingLink,
  String? description,
  String? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'isZoom': isZoom,
      'date': date,
      'time': time,
      'booking_link': bookingLink,
      'description': description,
      'address': address,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.isZoom == e2?.isZoom &&
        e1?.date == e2?.date &&
        e1?.time == e2?.time &&
        e1?.bookingLink == e2?.bookingLink &&
        e1?.description == e2?.description &&
        e1?.address == e2?.address;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.isZoom,
        e?.date,
        e?.time,
        e?.bookingLink,
        e?.description,
        e?.address
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}

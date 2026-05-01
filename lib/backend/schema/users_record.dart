import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "date_of_birth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  bool hasWeight() => _weight != null;

  // "height" field.
  int? _height;
  int get height => _height ?? 0;
  bool hasHeight() => _height != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "plusmember" field.
  bool? _plusmember;
  bool get plusmember => _plusmember ?? false;
  bool hasPlusmember() => _plusmember != null;

  // "progress" field.
  DocumentReference? _progress;
  DocumentReference? get progress => _progress;
  bool hasProgress() => _progress != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  bool hasSurname() => _surname != null;

  // "deleted" field.
  bool? _deleted;
  bool get deleted => _deleted ?? false;
  bool hasDeleted() => _deleted != null;

  // "additionals_id_views" field.
  List<String>? _additionalsIdViews;
  List<String> get additionalsIdViews => _additionalsIdViews ?? const [];
  bool hasAdditionalsIdViews() => _additionalsIdViews != null;

  // "current_level" field.
  int? _currentLevel;
  int get currentLevel => _currentLevel ?? 0;
  bool hasCurrentLevel() => _currentLevel != null;

  // "blocked" field.
  bool? _blocked;
  bool get blocked => _blocked ?? false;
  bool hasBlocked() => _blocked != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "goal_de" field.
  String? _goalDe;
  String get goalDe => _goalDe ?? '';
  bool hasGoalDe() => _goalDe != null;

  // "goal_en" field.
  String? _goalEn;
  String get goalEn => _goalEn ?? '';
  bool hasGoalEn() => _goalEn != null;

  // "gender_en" field.
  String? _genderEn;
  String get genderEn => _genderEn ?? '';
  bool hasGenderEn() => _genderEn != null;

  // "gender_de" field.
  String? _genderDe;
  String get genderDe => _genderDe ?? '';
  bool hasGenderDe() => _genderDe != null;

  // "lifetime" field.
  bool? _lifetime;
  bool get lifetime => _lifetime ?? false;
  bool hasLifetime() => _lifetime != null;

  // "expired_at" field.
  DateTime? _expiredAt;
  DateTime? get expiredAt => _expiredAt;
  bool hasExpiredAt() => _expiredAt != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "show_trial_dialog" field.
  bool? _showTrialDialog;
  bool get showTrialDialog => _showTrialDialog ?? false;
  bool hasShowTrialDialog() => _showTrialDialog != null;

  // "activeCampgainContactId" field.
  String? _activeCampgainContactId;
  String get activeCampgainContactId => _activeCampgainContactId ?? '';
  bool hasActiveCampgainContactId() => _activeCampgainContactId != null;

  // "hasPayable" field.
  bool? _hasPayable;
  bool get hasPayable => _hasPayable ?? false;
  bool hasHasPayable() => _hasPayable != null;

  // "goal_ja" field.
  String? _goalJa;
  String get goalJa => _goalJa ?? '';
  bool hasGoalJa() => _goalJa != null;

  // "gender_ja" field.
  String? _genderJa;
  String get genderJa => _genderJa ?? '';
  bool hasGenderJa() => _genderJa != null;

  // "currentAutomationId" field.
  String? _currentAutomationId;
  String get currentAutomationId => _currentAutomationId ?? '';
  bool hasCurrentAutomationId() => _currentAutomationId != null;

  // "currentAutomationType" field.
  ActiveCampaignAutomations? _currentAutomationType;
  ActiveCampaignAutomations? get currentAutomationType =>
      _currentAutomationType;
  bool hasCurrentAutomationType() => _currentAutomationType != null;

  // "currentContactList" field.
  String? _currentContactList;
  String get currentContactList => _currentContactList ?? '';
  bool hasCurrentContactList() => _currentContactList != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _dateOfBirth = snapshotData['date_of_birth'] as DateTime?;
    _weight = castToType<int>(snapshotData['weight']);
    _height = castToType<int>(snapshotData['height']);
    _status = snapshotData['status'] as String?;
    _plusmember = snapshotData['plusmember'] as bool?;
    _progress = snapshotData['progress'] as DocumentReference?;
    _surname = snapshotData['surname'] as String?;
    _deleted = snapshotData['deleted'] as bool?;
    _additionalsIdViews = getDataList(snapshotData['additionals_id_views']);
    _currentLevel = castToType<int>(snapshotData['current_level']);
    _blocked = snapshotData['blocked'] as bool?;
    _role = snapshotData['role'] as String?;
    _goalDe = snapshotData['goal_de'] as String?;
    _goalEn = snapshotData['goal_en'] as String?;
    _genderEn = snapshotData['gender_en'] as String?;
    _genderDe = snapshotData['gender_de'] as String?;
    _lifetime = snapshotData['lifetime'] as bool?;
    _expiredAt = snapshotData['expired_at'] as DateTime?;
    _language = snapshotData['language'] as String?;
    _showTrialDialog = snapshotData['show_trial_dialog'] as bool?;
    _activeCampgainContactId =
        snapshotData['activeCampgainContactId'] as String?;
    _hasPayable = snapshotData['hasPayable'] as bool?;
    _goalJa = snapshotData['goal_ja'] as String?;
    _genderJa = snapshotData['gender_ja'] as String?;
    _currentAutomationId = snapshotData['currentAutomationId'] as String?;
    _currentAutomationType =
        snapshotData['currentAutomationType'] is ActiveCampaignAutomations
            ? snapshotData['currentAutomationType']
            : deserializeEnum<ActiveCampaignAutomations>(
                snapshotData['currentAutomationType']);
    _currentContactList = snapshotData['currentContactList'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? dateOfBirth,
  int? weight,
  int? height,
  String? status,
  bool? plusmember,
  DocumentReference? progress,
  String? surname,
  bool? deleted,
  int? currentLevel,
  bool? blocked,
  String? role,
  String? goalDe,
  String? goalEn,
  String? genderEn,
  String? genderDe,
  bool? lifetime,
  DateTime? expiredAt,
  String? language,
  bool? showTrialDialog,
  String? activeCampgainContactId,
  bool? hasPayable,
  String? goalJa,
  String? genderJa,
  String? currentAutomationId,
  ActiveCampaignAutomations? currentAutomationType,
  String? currentContactList,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'date_of_birth': dateOfBirth,
      'weight': weight,
      'height': height,
      'status': status,
      'plusmember': plusmember,
      'progress': progress,
      'surname': surname,
      'deleted': deleted,
      'current_level': currentLevel,
      'blocked': blocked,
      'role': role,
      'goal_de': goalDe,
      'goal_en': goalEn,
      'gender_en': genderEn,
      'gender_de': genderDe,
      'lifetime': lifetime,
      'expired_at': expiredAt,
      'language': language,
      'show_trial_dialog': showTrialDialog,
      'activeCampgainContactId': activeCampgainContactId,
      'hasPayable': hasPayable,
      'goal_ja': goalJa,
      'gender_ja': genderJa,
      'currentAutomationId': currentAutomationId,
      'currentAutomationType': currentAutomationType,
      'currentContactList': currentContactList,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.weight == e2?.weight &&
        e1?.height == e2?.height &&
        e1?.status == e2?.status &&
        e1?.plusmember == e2?.plusmember &&
        e1?.progress == e2?.progress &&
        e1?.surname == e2?.surname &&
        e1?.deleted == e2?.deleted &&
        listEquality.equals(e1?.additionalsIdViews, e2?.additionalsIdViews) &&
        e1?.currentLevel == e2?.currentLevel &&
        e1?.blocked == e2?.blocked &&
        e1?.role == e2?.role &&
        e1?.goalDe == e2?.goalDe &&
        e1?.goalEn == e2?.goalEn &&
        e1?.genderEn == e2?.genderEn &&
        e1?.genderDe == e2?.genderDe &&
        e1?.lifetime == e2?.lifetime &&
        e1?.expiredAt == e2?.expiredAt &&
        e1?.language == e2?.language &&
        e1?.showTrialDialog == e2?.showTrialDialog &&
        e1?.activeCampgainContactId == e2?.activeCampgainContactId &&
        e1?.hasPayable == e2?.hasPayable &&
        e1?.goalJa == e2?.goalJa &&
        e1?.genderJa == e2?.genderJa &&
        e1?.currentAutomationId == e2?.currentAutomationId &&
        e1?.currentAutomationType == e2?.currentAutomationType &&
        e1?.currentContactList == e2?.currentContactList;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.dateOfBirth,
        e?.weight,
        e?.height,
        e?.status,
        e?.plusmember,
        e?.progress,
        e?.surname,
        e?.deleted,
        e?.additionalsIdViews,
        e?.currentLevel,
        e?.blocked,
        e?.role,
        e?.goalDe,
        e?.goalEn,
        e?.genderEn,
        e?.genderDe,
        e?.lifetime,
        e?.expiredAt,
        e?.language,
        e?.showTrialDialog,
        e?.activeCampgainContactId,
        e?.hasPayable,
        e?.goalJa,
        e?.genderJa,
        e?.currentAutomationId,
        e?.currentAutomationType,
        e?.currentContactList
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}

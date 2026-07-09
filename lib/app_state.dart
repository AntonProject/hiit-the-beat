import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _hideBanners = prefs.getStringList('ff_hideBanners') ?? _hideBanners;
    });
    _safeInit(() {
      _hideCompleted = prefs.getBool('ff_hideCompleted') ?? _hideCompleted;
    });
    _safeInit(() {
      _levels = prefs
              .getStringList('ff_levels')
              ?.map((x) {
                try {
                  return LevelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _levels;
    });
    _safeInit(() {
      _types = prefs
              .getStringList('ff_types')
              ?.map((x) {
                try {
                  return LevelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _types;
    });
    _safeInit(() {
      _goalsList = prefs
              .getStringList('ff_goalsList')
              ?.map((x) {
                try {
                  return LevelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _goalsList;
    });
    _safeInit(() {
      _genders = prefs
              .getStringList('ff_genders')
              ?.map((x) {
                try {
                  return LevelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _genders;
    });
    _safeInit(() {
      _requestFBpermission =
          prefs.getBool('ff_requestFBpermission') ?? _requestFBpermission;
    });
    _safeInit(() {
      _firstOpen = prefs.getBool('ff_firstOpen') ?? _firstOpen;
    });
    _safeInit(() {
      _onboardingHome = prefs.getBool('ff_onboardingHome') ?? _onboardingHome;
    });
    _safeInit(() {
      _onboardingStep = prefs.getInt('ff_onboardingStep') ?? _onboardingStep;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _hideBanners = [];
  List<String> get hideBanners => _hideBanners;
  set hideBanners(List<String> value) {
    _hideBanners = value;
    prefs.setStringList('ff_hideBanners', value);
  }

  void addToHideBanners(String value) {
    hideBanners.add(value);
    prefs.setStringList('ff_hideBanners', _hideBanners);
  }

  void removeFromHideBanners(String value) {
    hideBanners.remove(value);
    prefs.setStringList('ff_hideBanners', _hideBanners);
  }

  void removeAtIndexFromHideBanners(int index) {
    hideBanners.removeAt(index);
    prefs.setStringList('ff_hideBanners', _hideBanners);
  }

  void updateHideBannersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    hideBanners[index] = updateFn(_hideBanners[index]);
    prefs.setStringList('ff_hideBanners', _hideBanners);
  }

  void insertAtIndexInHideBanners(int index, String value) {
    hideBanners.insert(index, value);
    prefs.setStringList('ff_hideBanners', _hideBanners);
  }

  String _seasonFilter = 'de';
  String get seasonFilter => _seasonFilter;
  set seasonFilter(String value) {
    _seasonFilter = value;
  }

  bool _hideCompleted = false;
  bool get hideCompleted => _hideCompleted;
  set hideCompleted(bool value) {
    _hideCompleted = value;
    prefs.setBool('ff_hideCompleted', value);
  }

  List<LevelStruct> _levels = [
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"1\",\"title_en\":\"Beginner\",\"title_de\":\"Beginner\",\"title_ja\":\"Beginner\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"2\",\"title_en\":\"Advanced\",\"title_de\":\"Advanced\",\"title_ja\":\"Advanced\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"3\",\"title_en\":\"Expert\",\"title_de\":\"Expert\",\"title_ja\":\"Expert\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"4\",\"title_en\":\"Godmode\",\"title_de\":\"Godmode\",\"title_ja\":\"Godmode\"}'))
  ];
  List<LevelStruct> get levels => _levels;
  set levels(List<LevelStruct> value) {
    _levels = value;
    prefs.setStringList('ff_levels', value.map((x) => x.serialize()).toList());
  }

  void addToLevels(LevelStruct value) {
    levels.add(value);
    prefs.setStringList(
        'ff_levels', _levels.map((x) => x.serialize()).toList());
  }

  void removeFromLevels(LevelStruct value) {
    levels.remove(value);
    prefs.setStringList(
        'ff_levels', _levels.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLevels(int index) {
    levels.removeAt(index);
    prefs.setStringList(
        'ff_levels', _levels.map((x) => x.serialize()).toList());
  }

  void updateLevelsAtIndex(
    int index,
    LevelStruct Function(LevelStruct) updateFn,
  ) {
    levels[index] = updateFn(_levels[index]);
    prefs.setStringList(
        'ff_levels', _levels.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLevels(int index, LevelStruct value) {
    levels.insert(index, value);
    prefs.setStringList(
        'ff_levels', _levels.map((x) => x.serialize()).toList());
  }

  int _warmupPoints = 5;
  int get warmupPoints => _warmupPoints;
  set warmupPoints(int value) {
    _warmupPoints = value;
  }

  int _cooldownPoints = 5;
  int get cooldownPoints => _cooldownPoints;
  set cooldownPoints(int value) {
    _cooldownPoints = value;
  }

  List<LevelStruct> _types = [
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"1\",\"title_en\":\"Warm Ups\",\"title_de\":\"Warm Ups\",\"title_ja\":\"Warm Ups\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"2\",\"title_en\":\"Cool Downs\",\"title_de\":\"Cool Downs\",\"title_ja\":\"Cool Downs\"}'))
  ];
  List<LevelStruct> get types => _types;
  set types(List<LevelStruct> value) {
    _types = value;
    prefs.setStringList('ff_types', value.map((x) => x.serialize()).toList());
  }

  void addToTypes(LevelStruct value) {
    types.add(value);
    prefs.setStringList('ff_types', _types.map((x) => x.serialize()).toList());
  }

  void removeFromTypes(LevelStruct value) {
    types.remove(value);
    prefs.setStringList('ff_types', _types.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTypes(int index) {
    types.removeAt(index);
    prefs.setStringList('ff_types', _types.map((x) => x.serialize()).toList());
  }

  void updateTypesAtIndex(
    int index,
    LevelStruct Function(LevelStruct) updateFn,
  ) {
    types[index] = updateFn(_types[index]);
    prefs.setStringList('ff_types', _types.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTypes(int index, LevelStruct value) {
    types.insert(index, value);
    prefs.setStringList('ff_types', _types.map((x) => x.serialize()).toList());
  }

  List<LevelStruct> _goalsList = [
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"1\",\"title_en\":\"Get more fit\",\"title_de\":\"Fitter werden\",\"title_ja\":\"もっと健康になる\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"2\",\"title_en\":\"Lose weight\",\"title_de\":\"Gewicht verlieren\",\"title_ja\":\"体重を減らす\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"3\",\"title_en\":\"Build muscle\",\"title_de\":\"Athletischer werden\",\"title_ja\":\"筋肉を鍛える\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"4\",\"title_en\":\"Stay healthy\",\"title_de\":\"Gesund bleiben\",\"title_ja\":\"健康を維持する\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"5\",\"title_en\":\"Build strength and endurance\",\"title_de\":\"Mehr Kraft aufbauen und Ausdauer verbessern\",\"title_ja\":\"強さと持久力を高める\"}'))
  ];
  List<LevelStruct> get goalsList => _goalsList;
  set goalsList(List<LevelStruct> value) {
    _goalsList = value;
    prefs.setStringList(
        'ff_goalsList', value.map((x) => x.serialize()).toList());
  }

  void addToGoalsList(LevelStruct value) {
    goalsList.add(value);
    prefs.setStringList(
        'ff_goalsList', _goalsList.map((x) => x.serialize()).toList());
  }

  void removeFromGoalsList(LevelStruct value) {
    goalsList.remove(value);
    prefs.setStringList(
        'ff_goalsList', _goalsList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromGoalsList(int index) {
    goalsList.removeAt(index);
    prefs.setStringList(
        'ff_goalsList', _goalsList.map((x) => x.serialize()).toList());
  }

  void updateGoalsListAtIndex(
    int index,
    LevelStruct Function(LevelStruct) updateFn,
  ) {
    goalsList[index] = updateFn(_goalsList[index]);
    prefs.setStringList(
        'ff_goalsList', _goalsList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInGoalsList(int index, LevelStruct value) {
    goalsList.insert(index, value);
    prefs.setStringList(
        'ff_goalsList', _goalsList.map((x) => x.serialize()).toList());
  }

  List<LevelStruct> _genders = [
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"1\",\"title_en\":\"Male\",\"title_de\":\"Männlich\",\"title_ja\":\"男\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"2\",\"title_en\":\"Female\",\"title_de\":\"Weiblich\",\"title_ja\":\"女性\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"3\",\"title_en\":\"Other\",\"title_de\":\"Divers\",\"title_ja\":\"他の\"}'))
  ];
  List<LevelStruct> get genders => _genders;
  set genders(List<LevelStruct> value) {
    _genders = value;
    prefs.setStringList('ff_genders', value.map((x) => x.serialize()).toList());
  }

  void addToGenders(LevelStruct value) {
    genders.add(value);
    prefs.setStringList(
        'ff_genders', _genders.map((x) => x.serialize()).toList());
  }

  void removeFromGenders(LevelStruct value) {
    genders.remove(value);
    prefs.setStringList(
        'ff_genders', _genders.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromGenders(int index) {
    genders.removeAt(index);
    prefs.setStringList(
        'ff_genders', _genders.map((x) => x.serialize()).toList());
  }

  void updateGendersAtIndex(
    int index,
    LevelStruct Function(LevelStruct) updateFn,
  ) {
    genders[index] = updateFn(_genders[index]);
    prefs.setStringList(
        'ff_genders', _genders.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInGenders(int index, LevelStruct value) {
    genders.insert(index, value);
    prefs.setStringList(
        'ff_genders', _genders.map((x) => x.serialize()).toList());
  }

  int _subscriptionLooop = 0;
  int get subscriptionLooop => _subscriptionLooop;
  set subscriptionLooop(int value) {
    _subscriptionLooop = value;
  }

  bool _requestFBpermission = true;
  bool get requestFBpermission => _requestFBpermission;
  set requestFBpermission(bool value) {
    _requestFBpermission = value;
    prefs.setBool('ff_requestFBpermission', value);
  }

  DateTime? _refreshDate;
  DateTime? get refreshDate => _refreshDate;
  set refreshDate(DateTime? value) {
    _refreshDate = value;
  }

  bool _firstOpen = true;
  bool get firstOpen => _firstOpen;
  set firstOpen(bool value) {
    _firstOpen = value;
    prefs.setBool('ff_firstOpen', value);
  }

  bool _onboardingHome = true;
  bool get onboardingHome => _onboardingHome;
  set onboardingHome(bool value) {
    _onboardingHome = value;
    prefs.setBool('ff_onboardingHome', value);
  }

  int _onboardingStep = 1;
  int get onboardingStep => _onboardingStep;
  set onboardingStep(int value) {
    _onboardingStep = value;
    prefs.setInt('ff_onboardingStep', value);
  }

  String _pendingDeepLinkPage = '';
  String get pendingDeepLinkPage => _pendingDeepLinkPage;
  set pendingDeepLinkPage(String value) {
    _pendingDeepLinkPage = value;
  }

  final _workoutsManager = FutureRequestManager<List<WorkoutsRecord>>();
  Future<List<WorkoutsRecord>> workouts({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<WorkoutsRecord>> Function() requestFn,
  }) =>
      _workoutsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearWorkoutsCache() => _workoutsManager.clear();
  void clearWorkoutsCacheKey(String? uniqueKey) =>
      _workoutsManager.clearRequest(uniqueKey);

  final _seasonsManager = FutureRequestManager<List<SeasonsRecord>>();
  Future<List<SeasonsRecord>> seasons({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<SeasonsRecord>> Function() requestFn,
  }) =>
      _seasonsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSeasonsCache() => _seasonsManager.clear();
  void clearSeasonsCacheKey(String? uniqueKey) =>
      _seasonsManager.clearRequest(uniqueKey);

  final _usersManager = FutureRequestManager<List<UsersRecord>>();
  Future<List<UsersRecord>> users({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsersRecord>> Function() requestFn,
  }) =>
      _usersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUsersCache() => _usersManager.clear();
  void clearUsersCacheKey(String? uniqueKey) =>
      _usersManager.clearRequest(uniqueKey);

  final _addManager = FutureRequestManager<List<AdditionalsRecord>>();
  Future<List<AdditionalsRecord>> add({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AdditionalsRecord>> Function() requestFn,
  }) =>
      _addManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAddCache() => _addManager.clear();
  void clearAddCacheKey(String? uniqueKey) =>
      _addManager.clearRequest(uniqueKey);

  final _zoomManager = FutureRequestManager<List<AdditionalsRecord>>();
  Future<List<AdditionalsRecord>> zoom({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AdditionalsRecord>> Function() requestFn,
  }) =>
      _zoomManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearZoomCache() => _zoomManager.clear();
  void clearZoomCacheKey(String? uniqueKey) =>
      _zoomManager.clearRequest(uniqueKey);

  final _bannersManager = FutureRequestManager<List<VideosRecord>>();
  Future<List<VideosRecord>> banners({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<VideosRecord>> Function() requestFn,
  }) =>
      _bannersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBannersCache() => _bannersManager.clear();
  void clearBannersCacheKey(String? uniqueKey) =>
      _bannersManager.clearRequest(uniqueKey);

  final _promoManager = FutureRequestManager<List<PromoRecord>>();
  Future<List<PromoRecord>> promo({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<PromoRecord>> Function() requestFn,
  }) =>
      _promoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPromoCache() => _promoManager.clear();
  void clearPromoCacheKey(String? uniqueKey) =>
      _promoManager.clearRequest(uniqueKey);

  final _progressManager = FutureRequestManager<List<ProgressRecord>>();
  Future<List<ProgressRecord>> progress({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ProgressRecord>> Function() requestFn,
  }) =>
      _progressManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProgressCache() => _progressManager.clear();
  void clearProgressCacheKey(String? uniqueKey) =>
      _progressManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

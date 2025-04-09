import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
      _warmupPoints = prefs.getInt('ff_warmupPoints') ?? _warmupPoints;
    });
    _safeInit(() {
      _cooldownPoints = prefs.getInt('ff_cooldownPoints') ?? _cooldownPoints;
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
      _adminPage = prefs.getString('ff_adminPage') ?? _adminPage;
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

  String _seasonFilter = 'all';
  String get seasonFilter => _seasonFilter;
  set seasonFilter(String value) {
    _seasonFilter = value;
  }

  bool _hideCompleted = false;
  bool get hideCompleted => _hideCompleted;
  set hideCompleted(bool value) {
    _hideCompleted = value;
  }

  List<LevelStruct> _levels = [
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"1\",\"title_en\":\"Beginner\",\"title_de\":\"Beginner\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"2\",\"title_en\":\"Advanced\",\"title_de\":\"Advanced\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"3\",\"title_en\":\"Expert\",\"title_de\":\"Expert\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"4\",\"title_en\":\"Godmode\",\"title_de\":\"Godmode\"}'))
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

  int _warmupPoints = 2;
  int get warmupPoints => _warmupPoints;
  set warmupPoints(int value) {
    _warmupPoints = value;
    prefs.setInt('ff_warmupPoints', value);
  }

  int _cooldownPoints = 2;
  int get cooldownPoints => _cooldownPoints;
  set cooldownPoints(int value) {
    _cooldownPoints = value;
    prefs.setInt('ff_cooldownPoints', value);
  }

  List<LevelStruct> _types = [
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"1\",\"title_en\":\"Warm Ups\",\"title_de\":\"Warm Ups\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"2\",\"title_en\":\"Cool Downs\",\"title_de\":\"Cool Downs\"}'))
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
        '{\"number\":\"1\",\"title_en\":\"Get more fit\",\"title_de\":\"Fitter werden\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"2\",\"title_en\":\"Lose weight\",\"title_de\":\"Gewicht verlieren\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"3\",\"title_en\":\"Build muscle\",\"title_de\":\"Athletischer werden\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"4\",\"title_en\":\"Stay healthy\",\"title_de\":\"Gesund bleiben\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"5\",\"title_en\":\"Build strength and endurance\",\"title_de\":\"Mehr Kraft aufbauen und Ausdauer verbessern\"}'))
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
        '{\"number\":\"1\",\"title_en\":\"Male\",\"title_de\":\"Männlich\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"2\",\"title_en\":\"Female\",\"title_de\":\"Weiblich\"}')),
    LevelStruct.fromSerializableMap(jsonDecode(
        '{\"number\":\"3\",\"title_en\":\"Other\",\"title_de\":\"Divers\"}'))
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

  String _adminPage = 'users';
  String get adminPage => _adminPage;
  set adminPage(String value) {
    _adminPage = value;
    prefs.setString('ff_adminPage', value);
  }

  String _goalEn = 'Get more fit';
  String get goalEn => _goalEn;
  set goalEn(String value) {
    _goalEn = value;
  }

  String _goalDe = 'Fitter werden';
  String get goalDe => _goalDe;
  set goalDe(String value) {
    _goalDe = value;
  }

  int _subscriptionLooop = 0;
  int get subscriptionLooop => _subscriptionLooop;
  set subscriptionLooop(int value) {
    _subscriptionLooop = value;
  }
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

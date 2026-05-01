import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

double? passCheckupProgress(String? pass) {
  if (pass == null || pass.isEmpty) return 0;

  int count = 0;

  if (pass.length >= 8) count++;

  if (RegExp(r'[a-z]').hasMatch(pass)) count++;

  if (RegExp(r'[A-Z]').hasMatch(pass)) count++;

  if (RegExp(r'[0-9]').hasMatch(pass)) count++;

  return count / 4;
}

String? durationListIntToTime(
  List<int> duration,
  String language,
) {
  try {
    int totalDuration = duration.fold(0, (sum, item) => sum + item);

    final Map<String, String> labels = {
      'minute': language == 'de' ? 'min' : (language == 'ja' ? '分' : 'min'),
      'minutes': language == 'de' ? 'min' : (language == 'ja' ? '分' : 'min'),
      'hour': language == 'de' ? 'Stunde' : (language == 'ja' ? '時間' : 'hour'),
      'hours':
          language == 'de' ? 'Stunden' : (language == 'ja' ? '時間' : 'hours'),
      'day': language == 'de' ? 'Tag' : (language == 'ja' ? '日' : 'day'),
      'days': language == 'de' ? 'Tage' : (language == 'ja' ? '日' : 'days'),
      'week': language == 'de' ? 'Woche' : (language == 'ja' ? '週間' : 'week'),
      'weeks':
          language == 'de' ? 'Wochen' : (language == 'ja' ? '週間' : 'weeks'),
    };

    double minutes = totalDuration / (1000 * 60);
    double hours = minutes / 60;
    double days = hours / 24;
    double weeks = days / 7;

    if (weeks >= 1) {
      if (days % 7 >= 5) {
        int weekCount = (weeks + 1).floor();
        String label = weekCount == 1 ? labels['week']! : labels['weeks']!;

        return language == 'ja' ? '$weekCount$label' : '$weekCount $label';
      } else {
        int weekCount = weeks.floor();
        String label = weekCount == 1 ? labels['week']! : labels['weeks']!;
        return language == 'ja' ? '$weekCount$label' : '$weekCount $label';
      }
    }
    if (days >= 1) {
      if (hours % 24 >= 12) {
        int dayCount = (days + 1).floor();
        String label = dayCount == 1 ? labels['day']! : labels['days']!;
        return language == 'ja' ? '$dayCount$label' : '$dayCount $label';
      } else {
        int dayCount = days.floor();
        String label = dayCount == 1 ? labels['day']! : labels['days']!;
        return language == 'ja' ? '$dayCount$label' : '$dayCount $label';
      }
    }
    if (hours >= 1) {
      if (minutes % 60 >= 30) {
        int hourCount = (hours + 1).floor();
        String label = hourCount == 1 ? labels['hour']! : labels['hours']!;
        return language == 'ja' ? '$hourCount$label' : '$hourCount $label';
      } else {
        int hourCount = hours.floor();
        String label = hourCount == 1 ? labels['hour']! : labels['hours']!;
        return language == 'ja' ? '$hourCount$label' : '$hourCount $label';
      }
    }

    int minuteCount = (minutes + 0.5).ceil();
    String minuteLabel = language == 'ja' ? '分' : 'min';
    return language == 'ja'
        ? '$minuteCount$minuteLabel'
        : '$minuteCount $minuteLabel';
  } catch (e) {
    return null;
  }
}

bool emailFormatCheck(String? email) {
  if (email == null || email.isEmpty) {
    return false;
  }

  final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      caseSensitive: false);

  return emailRegex.hasMatch(email);
}

List<SeasonsRecord>? filterSeasons(
  int level,
  String filterAppstate,
  List<SeasonsRecord>? seasons,
  bool hideCompeted,
  List<SeasonStatisticStruct>? seasonDone,
) {
  if (seasons == null || seasons.isEmpty) {
    return null;
  }
  // Filter by level first
  var levelFiltered = seasons.where((season) => season.level == level).toList();
  if (levelFiltered.isEmpty) {
    return null;
  }

  if (hideCompeted && seasonDone != null && seasonDone.isNotEmpty) {
    final completedSeasonIds = seasonDone.map((stat) => stat.seasonId).toSet();

    levelFiltered = levelFiltered
        .where((season) => !completedSeasonIds.contains(season.reference.id))
        .toList();

    if (levelFiltered.isEmpty) {
      return null;
    }
  }
  // Then filter by language
  switch (filterAppstate.toLowerCase()) {
    case 'en':
      // Only EN: en == true AND de == false
      final filtered = levelFiltered
          .where((season) => season.en == true && season.de == false)
          .toList();
      return filtered.isEmpty ? null : filtered;

    case 'de':
      // Only DE: de == true AND en == false
      final filtered = levelFiltered
          .where((season) => season.de == true && season.en == false)
          .toList();
      return filtered.isEmpty ? null : filtered;

    case 'all':
      // Return all seasons without language filtering
      return levelFiltered;

    default:
      return levelFiltered;
  }
}

String? durationIntToTime(
  int duration,
  String language,
) {
  try {
    final Map<String, String> labels = {
      'minute': language == 'de' ? 'min' : (language == 'ja' ? '分' : 'min'),
      'minutes': language == 'de' ? 'min' : (language == 'ja' ? '分' : 'min'),
      'hour': language == 'de' ? 'Stunde' : (language == 'ja' ? '時間' : 'hour'),
      'hours':
          language == 'de' ? 'Stunden' : (language == 'ja' ? '時間' : 'hours'),
      'day': language == 'de' ? 'Tag' : (language == 'ja' ? '日' : 'day'),
      'days': language == 'de' ? 'Tage' : (language == 'ja' ? '日' : 'days'),
      'week': language == 'de' ? 'Woche' : (language == 'ja' ? '週間' : 'week'),
      'weeks':
          language == 'de' ? 'Wochen' : (language == 'ja' ? '週間' : 'weeks'),
    };

    double minutes = duration / (1000 * 60);
    double hours = minutes / 60;
    double days = hours / 24;
    double weeks = days / 7;

    if (weeks >= 1) {
      if (days % 7 >= 5) {
        int weekCount = (weeks + 1).floor();
        String label = weekCount == 1 ? labels['week']! : labels['weeks']!;

        return language == 'ja' ? '$weekCount$label' : '$weekCount $label';
      } else {
        int weekCount = weeks.floor();
        String label = weekCount == 1 ? labels['week']! : labels['weeks']!;
        return language == 'ja' ? '$weekCount$label' : '$weekCount $label';
      }
    }
    if (days >= 1) {
      if (hours % 24 >= 12) {
        int dayCount = (days + 1).floor();
        String label = dayCount == 1 ? labels['day']! : labels['days']!;
        return language == 'ja' ? '$dayCount$label' : '$dayCount $label';
      } else {
        int dayCount = days.floor();
        String label = dayCount == 1 ? labels['day']! : labels['days']!;
        return language == 'ja' ? '$dayCount$label' : '$dayCount $label';
      }
    }
    if (hours >= 1) {
      if (minutes % 60 >= 30) {
        int hourCount = (hours + 1).floor();
        String label = hourCount == 1 ? labels['hour']! : labels['hours']!;
        return language == 'ja' ? '$hourCount$label' : '$hourCount $label';
      } else {
        int hourCount = hours.floor();
        String label = hourCount == 1 ? labels['hour']! : labels['hours']!;
        return language == 'ja' ? '$hourCount$label' : '$hourCount $label';
      }
    }
    // Для минут
    int minuteCount = (minutes + 0.5).ceil();
    String minuteLabel = language == 'ja' ? '分' : 'min';
    return language == 'ja'
        ? '$minuteCount$minuteLabel'
        : '$minuteCount $minuteLabel';
  } catch (e) {
    return null;
  }
}

DateTime lastActivityWorkout(
  List<WorkoutStatisticStruct>? workoutDone,
  String workoutId,
) {
  return workoutDone
          ?.where((workout) => workout.workoutId == workoutId)
          .map((workout) => workout.datetime)
          .whereType<DateTime>()
          .reduce((latest, date) => latest.isAfter(date) ? latest : date) ??
      DateTime.now();
}

List<SeasonsRecord>? seasonsNotDone(
  int level,
  List<SeasonsRecord>? seasons,
  List<SeasonStatisticStruct>? seasonDone,
  List<WorkoutStatisticStruct>? workoutDone,
) {
  if (seasons == null || seasons.isEmpty) {
    return null;
  }
  final actualLevel = (level == null || level == 0) ? 1 : level;
  // Filter by level first
  var levelFiltered =
      seasons.where((season) => season.level == actualLevel).toList();
  if (levelFiltered.isEmpty) {
    return null;
  }

  if ((seasonDone == null || seasonDone.isEmpty) &&
      (workoutDone == null || workoutDone.isEmpty)) {
    return levelFiltered;
  }

  final completedSeasonIds =
      seasonDone?.map((stat) => stat.seasonId).toSet() ?? {};

  final startedSeasonIds =
      workoutDone?.map((workout) => workout.seasonId).toSet() ?? {};

  final allTouchedSeasonIds = {...completedSeasonIds, ...startedSeasonIds};

  levelFiltered = levelFiltered
      .where((season) => !allTouchedSeasonIds.contains(season.reference.id))
      .toList();

  return levelFiltered;
}

int totalPoints(List<WorkoutStatisticStruct>? workoutDone) {
  if (workoutDone == null || workoutDone.isEmpty) {
    return 0;
  }

  return workoutDone.fold(0, (sum, workout) {
    final workoutPoints = workout.workoutPoints ?? 0;
    final warpmupPoints = workout.warpmupPoints ?? 0;
    final cooldownPoints = workout.cooldownPoints ?? 0;

    return sum + workoutPoints + warpmupPoints + cooldownPoints;
  });
}

bool workoutSeasonExistOrNotDone(
  List<WorkoutStatisticStruct>? workoutDone,
  String seasonId,
  int workoutCount,
) {
// Базовые проверки
  if (workoutDone == null || seasonId.isEmpty || workoutCount == 0) {
    return false;
  }

  // Получаем все воркауты текущего сезона
  final seasonWorkouts =
      workoutDone.where((workout) => workout.seasonId == seasonId);

  // Проверяем существует ли сезон в выполненных воркаутах
  if (seasonWorkouts.isEmpty) {
    return false;
  }

  // Группируем воркауты по ID и подсчитываем количество выполнений
  final workoutCompletions = <String, int>{};

  for (var workout in seasonWorkouts) {
    workoutCompletions[workout.workoutId] =
        (workoutCompletions[workout.workoutId] ?? 0) + 1;
  }

  // Проверяем что все воркауты выполнены по 3 раза
  final isAllWorkoutsCompleted = workoutCompletions.length == workoutCount &&
      workoutCompletions.values.every((count) => count >= 3);

  // Возвращаем true если сезон существует и НЕ все воркауты выполнены по 3 раза
  return !isAllWorkoutsCompleted;
}

DateTime lastActivitySeason(
  List<WorkoutStatisticStruct>? workoutDone,
  String seasonId,
) {
  return workoutDone
          ?.where((workout) => workout.seasonId == seasonId)
          .map((workout) => workout.datetime)
          .whereType<DateTime>()
          .reduce((latest, date) => latest.isAfter(date) ? latest : date) ??
      DateTime.now();
}

double totalPointsProgress(
  List<WorkoutStatisticStruct>? workoutDone,
  List<int>? total,
) {
  if (workoutDone == null ||
      workoutDone.isEmpty ||
      total == null ||
      total.isEmpty) {
    return 0;
  }

  // Calculate sum of total possible points (за каждый воркаут по одному разу)
  final totalPoints = total.fold(0, (sum, points) => sum + (points + 4));

  // Calculate sum of earned points (только лучший результат для каждого воркаута)
  final Map<String, int> bestScores = {};

  for (var workout in workoutDone) {
    final workoutId = workout.workoutId;
    final totalScore = (workout.workoutPoints ?? 0) +
        (workout.warpmupPoints ?? 2) +
        (workout.cooldownPoints ?? 2);

    if (!bestScores.containsKey(workoutId) ||
        bestScores[workoutId]! < totalScore) {
      bestScores[workoutId] = totalScore;
    }
  }

  final earnedPoints = bestScores.values.fold(0, (sum, points) => sum + points);

  // Calculate progress (0 to 1)
  if (totalPoints == 0) return 0;
  return earnedPoints / totalPoints > 1 ? 1 : earnedPoints / totalPoints;
}

bool workoutSeasonDone(
  List<WorkoutStatisticStruct>? workoutDone,
  String seasonId,
  int? workoutCount,
) {
  if (workoutDone == null ||
      seasonId.isEmpty ||
      workoutCount == null ||
      workoutCount == 0) {
    return false;
  }

  final seasonWorkouts =
      workoutDone.where((workout) => workout.seasonId == seasonId);

  final workoutCompletions = <String, int>{};

  for (var workout in seasonWorkouts) {
    workoutCompletions[workout.workoutId] =
        (workoutCompletions[workout.workoutId] ?? 0) + 1;
  }

  return workoutCompletions.length == workoutCount &&
      workoutCompletions.values.every((count) => count >= 3);
}

List<UserLevelStruct> levels() {
  // Define the levels data structure with corresponding points thresholds
  final levelData = [
    {"levelNumber": 1, "levelName": "Newbie", "points": 0},
    {"levelNumber": 2, "levelName": "Chunky Monkey", "points": 21},
    {"levelNumber": 3, "levelName": "Biceps Bunny", "points": 41},
    {"levelNumber": 4, "levelName": "Rookie", "points": 64},
    {"levelNumber": 5, "levelName": "Hangry Bird", "points": 90},
    {"levelNumber": 6, "levelName": "Road Runner", "points": 117},
    {"levelNumber": 7, "levelName": "Hobby Athlete", "points": 148},
    {"levelNumber": 8, "levelName": "Lightweight Baby", "points": 182},
    {"levelNumber": 9, "levelName": "Pound Dropper", "points": 210},
    {"levelNumber": 10, "levelName": "Challenger", "points": 260},
    {"levelNumber": 11, "levelName": "Footworker", "points": 305},
    {"levelNumber": 12, "levelName": "Gym Class Hero", "points": 355},
    {"levelNumber": 13, "levelName": "Playmaker", "points": 409},
    {"levelNumber": 14, "levelName": "Babyfreeze Master", "points": 469},
    {"levelNumber": 15, "levelName": "Beatkiller", "points": 535},
    {"levelNumber": 16, "levelName": "Workout Wonder", "points": 607},
    {"levelNumber": 17, "levelName": "Beast Booty", "points": 687},
    {"levelNumber": 18, "levelName": "Sixpack Analyst", "points": 775},
    {"levelNumber": 19, "levelName": "Explosive Mover", "points": 865},
    {"levelNumber": 20, "levelName": "Workout Hunter", "points": 955},
    {"levelNumber": 21, "levelName": "Gamechanger", "points": 1045},
    {"levelNumber": 22, "levelName": "King of Pushups", "points": 1135},
    {"levelNumber": 23, "levelName": "Vegeta", "points": 1230},
    {"levelNumber": 24, "levelName": "Core Dominator", "points": 1330},
    {"levelNumber": 25, "levelName": "Sweat Samurai", "points": 1420},
    {"levelNumber": 26, "levelName": "Cardio Crusher", "points": 1510},
    {"levelNumber": 27, "levelName": "Mobility Master", "points": 1600},
    {"levelNumber": 28, "levelName": "Form Freak", "points": 1690},
    {"levelNumber": 29, "levelName": "Power Panther", "points": 1780},
    {"levelNumber": 30, "levelName": "Iron Chest", "points": 1870},
    {"levelNumber": 31, "levelName": "Beastmode Rookie", "points": 1960},
    {"levelNumber": 32, "levelName": "Flexecutioner", "points": 2050},
    {"levelNumber": 33, "levelName": "Agility Ace", "points": 2140},
    {"levelNumber": 34, "levelName": "Bodyweight Champion", "points": 2230},
    {"levelNumber": 35, "levelName": "Pushup Prince", "points": 2320},
    {"levelNumber": 36, "levelName": "Rhythm Rebel", "points": 2410},
    {"levelNumber": 37, "levelName": "Plank Pirate", "points": 2500},
    {"levelNumber": 38, "levelName": "Jumping Juggernaut", "points": 2590},
    {"levelNumber": 39, "levelName": "Iron Dancer", "points": 2680},
    {"levelNumber": 40, "levelName": "Explosive Panther", "points": 2770},
    {"levelNumber": 41, "levelName": "Beast Beyond", "points": 2860},
    {"levelNumber": 42, "levelName": "Core Commander", "points": 2950},
    {"levelNumber": 43, "levelName": "Sprint Cyclone", "points": 3040},
    {"levelNumber": 44, "levelName": "Gravity Bender", "points": 3130},
    {"levelNumber": 45, "levelName": "Battle Beast", "points": 3220},
    {"levelNumber": 46, "levelName": "The Transformer", "points": 3310},
    {"levelNumber": 47, "levelName": "HIIT Legend", "points": 3400},
    {"levelNumber": 48, "levelName": "Push Warrior", "points": 3490},
    {"levelNumber": 49, "levelName": "Rage Releaser", "points": 3580},
    {"levelNumber": 50, "levelName": "King of Gods", "points": 3670}
  ];

  // Convert raw data to UserLevelStruct objects
  List<UserLevelStruct> userLevels = [];
  for (var level in levelData) {
    userLevels.add(UserLevelStruct(
      levelNumber: level["levelNumber"] as int,
      levenName: level["levelName"] as String,
      points: level["points"] as int,
    ));
  }

  return userLevels;
}

double workoutSeasonProgress(
  List<WorkoutStatisticStruct>? workoutDone,
  String seasonId,
  int? workoutCount,
) {
  if (workoutDone == null ||
      seasonId.isEmpty ||
      workoutCount == null ||
      workoutCount == 0) {
    return 0.0;
  }

  final seasonWorkouts =
      workoutDone.where((workout) => workout.seasonId == seasonId);

  final workoutCompletions = <String, int>{};

  for (var workout in seasonWorkouts) {
    workoutCompletions[workout.workoutId] =
        (workoutCompletions[workout.workoutId] ?? 0) + 1;
  }

  double totalProgress = 0.0;

  for (var count in workoutCompletions.values) {
    double workoutProgress = math.min(count / 3, 1.0);
    totalProgress += workoutProgress;
  }

  int missingWorkouts = workoutCount - workoutCompletions.length;

  return totalProgress / workoutCount;
}

bool seasonDoneExist(
  List<SeasonStatisticStruct>? seasonDone,
  String seasonId,
) {
  if (seasonDone == null || seasonDone.isEmpty || seasonId.isEmpty) {
    return false;
  }

  return seasonDone.any((season) => season.seasonId == seasonId);
}

DateTime? dayPlusInt(
  DateTime date,
  int num,
) {
  // day plus sum
  return date.add(Duration(days: num));
}

int durationBetween2dates(
  DateTime dateFrom,
  DateTime dateTo,
) {
  // duration between dateFrom to dateTo in days
  Duration difference = dateTo.difference(dateFrom);
  int days = difference.inDays;
  return days;
}

int userWorkoutPassed(
  List<ProgressRecord>? progress,
  String seasonId,
  String workoutId,
) {
  if (progress == null || progress.isEmpty) return 0;

  Set<DocumentReference> uniqueUsers = {};

  for (final record in progress) {
    final hasWorkout = record.workoutDone?.any((workout) =>
            workout.seasonId == seasonId && workout.workoutId == workoutId) ??
        false;

    if (hasWorkout && record.user != null) {
      uniqueUsers.add(record.user!);
    }
  }

  return uniqueUsers.length ?? 0;
}

bool search(
  String searchText,
  String? text1,
  String? text2,
  String? text3,
  String? text4,
  String? text5,
) {
  return text1!.toLowerCase().contains(searchText.toLowerCase()) ||
      text2!.toLowerCase().contains(searchText.toLowerCase()) ||
      text3!.toLowerCase().contains(searchText.toLowerCase()) ||
      text4!.toLowerCase().contains(searchText.toLowerCase()) ||
      text5!.toLowerCase().contains(searchText.toLowerCase());
}

int totalPointsLevel(List<WorkoutStatisticStruct>? workoutDone) {
  if (workoutDone == null || workoutDone.isEmpty) {
    return 0;
  }

  // Create a map to store the best score for each workout
  final Map<String, int> bestScores = {};

  // Iterate through all workouts and keep only the best score for each workout ID
  for (var workout in workoutDone) {
    final workoutId = workout.workoutId;
    final totalScore = (workout.workoutPoints ?? 0) +
        (workout.warpmupPoints ?? 0) +
        (workout.cooldownPoints ?? 0);

    // Save the best score for this workout
    if (!bestScores.containsKey(workoutId) ||
        bestScores[workoutId]! < totalScore) {
      bestScores[workoutId] = totalScore;
    }
  }

  // Sum up the best scores to get the total points
  final earnedPoints = bestScores.values.fold(0, (sum, points) => sum + points);

  return earnedPoints;
}

int nextSeasonInListSeasons(
  DocumentReference? season,
  List<DocumentReference>? seasonsList,
) {
  // Default index if not found
  int defaultIndex = 0;

  // Check if parameters are null or empty
  if (season == null) {
    return defaultIndex;
  }

  if (seasonsList == null || seasonsList.isEmpty) {
    return defaultIndex;
  }

  // Try to find the index of the season in the list
  for (int i = 0; i < seasonsList.length; i++) {
    // Compare document paths to see if they're the same reference
    if (seasonsList[i].path == season.path) {
      // Found the current season
      // Calculate next index with boundary check
      int nextIndex = i + 1;

      // If next index would be out of bounds, return the last valid index
      if (nextIndex >= seasonsList.length) {
        return seasonsList.length - 1;
      }

      return nextIndex;
    }
  }

  // If current season not found, return the default index
  return defaultIndex;
}

DateTime dateTimeCombine(
  DateTime? date,
  DateTime? time,
) {
  final now = DateTime.now();
  final finalDate = date ?? now;
  final finalTime = time ?? now;

  return DateTime(
    finalDate.year,
    finalDate.month,
    finalDate.day,
    finalTime.hour,
    finalTime.minute,
    finalTime.second,
    finalTime.millisecond,
    finalTime.microsecond,
  );
}

double totalPointsProgressLevel(
  List<WorkoutStatisticStruct>? workoutDone,
  List<UserLevelStruct> levelsList,
) {
  // Check if workoutDone is null or empty.
  if (workoutDone == null || workoutDone.isEmpty) {
    return 0.0;
  }

  // Check if levelsList is empty
  if (levelsList.isEmpty) {
    return 0.0;
  }

  // Calculate total earned points from workout statistics
  int earnedPoints = 0;
  for (var workout in workoutDone) {
    final int workoutPoints = workout.workoutPoints ?? 0;
    final int warpmupPoints = workout.warpmupPoints ?? 0;
    final int cooldownPoints = workout.cooldownPoints ?? 0;
    earnedPoints += workoutPoints + warpmupPoints + cooldownPoints;
  }

  // Find current level based on total earned points
  int currentLevelIndex = 0;
  bool levelFound = false;

  for (int i = levelsList.length - 1; i >= 0; i--) {
    final int levelPoints = levelsList[i].points ?? 0;
    if (earnedPoints >= levelPoints) {
      currentLevelIndex = i;
      levelFound = true;
      break;
    }
  }

  // If no level found, stay at level 0
  if (!levelFound) {
    currentLevelIndex = 0;
  }

  // Get current level points
  final int currentLevelMinPoints = levelsList[currentLevelIndex].points ?? 0;

  // Calculate next level points
  final int currentLevelMaxPoints;
  if (currentLevelIndex >= levelsList.length - 1) {
    currentLevelMaxPoints = currentLevelMinPoints + 100;
  } else {
    final int nextLevelPoints = levelsList[currentLevelIndex + 1].points ?? 0;
    currentLevelMaxPoints = nextLevelPoints;
  }

  // Calculate progress
  final int pointsInCurrentLevel = earnedPoints - currentLevelMinPoints;
  final int totalPointsInLevel = currentLevelMaxPoints - currentLevelMinPoints;

  // Avoid division by zero
  if (totalPointsInLevel <= 0) {
    return 1.0;
  }

  // Calculate progress within current level (0 to 1)
  final double progress = pointsInCurrentLevel / totalPointsInLevel;

  // Ensure progress is between 0 and 1
  return progress.clamp(0.0, 1.0);
}

int userSeasonPassed(
  List<ProgressRecord>? progress,
  String seasonId,
) {
  if (progress == null || progress.isEmpty) return 0;

  Set<DocumentReference> uniqueUsers = {};

  for (final record in progress) {
    final hasSeason =
        record.seasonDone?.any((season) => season.seasonId == seasonId) ??
            false;

    if (hasSeason && record.user != null) {
      uniqueUsers.add(record.user!);
    }
  }

  return uniqueUsers.length ?? 0;
}

String pricePeriod(
  String price,
  int period,
  String monthPrice,
  bool increase,
) {
  String cleanNumber(String price) {
    String cleaned = price.replaceAll(RegExp(r'[^\d.,]'), '');

    int commaIndex = cleaned.lastIndexOf(',');
    int dotIndex = cleaned.lastIndexOf('.');

    if (commaIndex != -1 && dotIndex != -1) {
      if (commaIndex > dotIndex) {
        cleaned = cleaned.replaceAll('.', '').replaceAll(',', '.');
      } else {
        cleaned = cleaned.replaceAll(',', '');
      }
    } else if (commaIndex != -1) {
      cleaned = cleaned.replaceAll(',', '.');
    }

    return cleaned;
  }

  if (monthPrice == "0") {
    if (period == 1) {
      return price.contains('₽') ? price.replaceAll('₽', 'RUB') : price;
    }

    String numStr = cleanNumber(price);
    if (numStr.isEmpty) {
      return price.contains('₽') ? price.replaceAll('₽', 'RUB') : price;
    }

    double? numValue = double.tryParse(numStr);
    if (numValue == null || numValue == 0) {
      return price.contains('₽') ? price.replaceAll('₽', 'RUB') : price;
    }

    numValue = double.parse(numValue.toStringAsFixed(2));

    String currency = price.replaceAll(RegExp(r'[\d\s.,]'), '').trim();
    currency =
        (currency.contains('₽') || currency.contains('RUB')) ? 'RUB' : currency;
    bool currencyAtStart = price.trimLeft().startsWith(RegExp(r'[^\d\s]'));

    double newPrice = increase ? numValue * period : numValue / period;
    String formattedPrice = newPrice % 1 == 0
        ? NumberFormat("#,##0").format(newPrice)
        : NumberFormat("#,##0.00").format(newPrice);

    String result = currencyAtStart
        ? '$currency $formattedPrice'
        : '$formattedPrice $currency';
    return result.contains('RUB') ? result : result.replaceAll('₽', 'RUB');
  } else {
    String priceNumStr = cleanNumber(price);
    String monthPriceNumStr = cleanNumber(monthPrice);

    double? priceValue = double.tryParse(priceNumStr);
    double? monthPriceValue = double.tryParse(monthPriceNumStr);

    if (priceNumStr.isEmpty ||
        monthPriceNumStr.isEmpty ||
        priceValue == null ||
        monthPriceValue == null ||
        priceValue == 0 ||
        monthPriceValue == 0) {
      return price.contains('₽') ? price.replaceAll('₽', 'RUB') : price;
    }

    priceValue = double.parse(priceValue.toStringAsFixed(2));
    monthPriceValue = double.parse(monthPriceValue.toStringAsFixed(2));

    String currency = price.replaceAll(RegExp(r'[\d\s.,]'), '').trim();
    currency =
        (currency.contains('₽') || currency.contains('RUB')) ? 'RUB' : currency;
    bool currencyAtStart = price.trimLeft().startsWith(RegExp(r'[^\d\s]'));

    double savings = (monthPriceValue * period) - priceValue;
    if (savings <= 0) {
      return currencyAtStart ? '$currency 0' : '0 $currency';
    }

    String formattedSavings = savings % 1 == 0
        ? NumberFormat("#,##0").format(savings)
        : NumberFormat("#,##0.00").format(savings);

    String result = currencyAtStart
        ? '$currency $formattedSavings'
        : '$formattedSavings $currency';
    return result.contains('RUB') ? result : result.replaceAll('₽', 'RUB');
  }
}

DateTime formatDateInCET(DateTime date) {
  bool isDST = date.month >= 3 && date.month <= 10;
  var cetOffset = isDST ? 2 : 1; // CEST(+2) or CET(+1)
  var localOffset = date.timeZoneOffset.inHours;
  var cetDate = date.add(Duration(hours: cetOffset - localOffset));

  return cetDate;
}

bool hasAutomationSeries(
  dynamic contactAutomations,
  String targetSeriesId,
) {
  var debug = true;
  if (debug) print('Checking for seriesId: "$targetSeriesId"');

  // Check if the data contains contactAutomations
  if (contactAutomations.containsKey('contactAutomations') &&
      contactAutomations['contactAutomations'] is List &&
      (contactAutomations['contactAutomations'] as List).isNotEmpty) {
    if (debug)
      print(
          'Found ${(contactAutomations['contactAutomations'] as List).length} automations');

    // Loop through each automation
    for (var automation in contactAutomations['contactAutomations']) {
      // Check if the current automation has the target seriesId
      if (automation is Map<String, dynamic> &&
          automation.containsKey('seriesid')) {
        if (debug)
          print(
              'Checking automation with seriesId: "${automation['seriesid']}"');

        if (automation['seriesid'] == targetSeriesId) {
          if (debug) print('Found matching seriesId: "$targetSeriesId"');
          return true;
        }
      }
    }

    if (debug) print('No matching seriesId found');
  } else if (debug) {
    print('No valid contactAutomations array found');
  }

  return false;
}

UserLevelStruct levelUser(
  int totalPoints,
  List<UserLevelStruct> levelsList,
) {
  // Find current level based on user's total points
  int currentLevelIndex = 0;

  // Iterate through levels to find the highest level the user qualifies for
  for (int i = levelsList.length - 1; i >= 0; i--) {
    if (totalPoints >= levelsList[i].points) {
      currentLevelIndex = i;
      break;
    }
  }

  // Return the user's current level
  return levelsList[currentLevelIndex];
}

bool newLevelAchieved(
  List<WorkoutStatisticStruct>? currentProgress,
  WorkoutStatisticStruct? newProgress,
  List<UserLevelStruct> levelsList,
) {
  // Handle null or empty currentProgress
  if (currentProgress == null) {
    currentProgress = [];
  }

  // Handle null newProgress
  if (newProgress == null) {
    return false;
  }

  // Calculate current total points
  final currentTotalPoints = currentProgress.fold(0, (sum, workout) {
    final workoutPoints = workout.workoutPoints ?? 0;
    final warpmupPoints = workout.warpmupPoints ?? 0;
    final cooldownPoints = workout.cooldownPoints ?? 0;
    return sum + workoutPoints + warpmupPoints + cooldownPoints;
  });

  // Calculate points from new progress
  final newWorkoutPoints = newProgress.workoutPoints ?? 0;
  final newWarpmupPoints = newProgress.warpmupPoints ?? 0;
  final newCooldownPoints = newProgress.cooldownPoints ?? 0;
  final newPoints = newWorkoutPoints + newWarpmupPoints + newCooldownPoints;

  // Calculate new total points
  final newTotalPoints = currentTotalPoints + newPoints;

  // Find current level based on current total points
  int currentLevelIndex = 0;
  for (int i = levelsList.length - 1; i >= 0; i--) {
    if (currentTotalPoints >= levelsList[i].points) {
      currentLevelIndex = i;
      break;
    }
  }

  // Find new level based on new total points
  int newLevelIndex = 0;
  for (int i = levelsList.length - 1; i >= 0; i--) {
    if (newTotalPoints >= levelsList[i].points) {
      newLevelIndex = i;
      break;
    }
  }

  // Return true if user achieved a new level
  return newLevelIndex > currentLevelIndex;
}

List<String> getAutomationIdsBySeries(
  List<int> automationSeries,
  dynamic inputData,
) {
  final contactAutomations = inputData['contactAutomations'] as List<dynamic>?;
  if (contactAutomations == null) return [];

  return contactAutomations
      .where((ca) {
        final seriesId = (ca as Map)['seriesid']?.toString();
        if (seriesId == null) return false;
        final parsedId = int.tryParse(seriesId);
        return parsedId != null && automationSeries.contains(parsedId);
      })
      .map<String>((ca) => (ca as Map)['id'].toString())
      .toList();
}

int seasonInListSeasons(
  DocumentReference? season,
  List<DocumentReference>? seasonsList,
) {
  // Default index if not found
  int defaultIndex = 0;

  // Check if parameters are null or empty
  if (season == null) {
    return defaultIndex;
  }

  if (seasonsList == null || seasonsList.isEmpty) {
    return defaultIndex;
  }

  // Try to find the index of the season in the list
  for (int i = 0; i < seasonsList.length; i++) {
    // Compare document paths to see if they're the same reference
    if (seasonsList[i].path == season.path) {
      return i;
    }
  }

  // If not found, return the default index
  return defaultIndex;
}

DateTime parseToLocal(DateTime date) {
  return date.toLocal();
}

String debugDate(DateTime dt) {
  final local = dt.toLocal();
  final utc = dt.toUtc();
  return 'raw=$dt | local=${local.toIso8601String()} offset=${local.timeZoneOffset} | utc=${utc.toIso8601String()}';
}

String getDayMonthTimeDateString(DateTime date) {
  return '${DateFormat('d MMMM', 'en_US').format(date.toLocal()).toLowerCase()}, ${DateFormat('HH:mm a', 'en_US').format(date.toLocal())}';
}

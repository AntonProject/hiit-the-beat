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

  // Счетчик выполненных условий
  int count = 0;

  // Проверка минимальной длины (8 символов)
  if (pass.length >= 8) count++;

  // Проверка наличия строчной буквы
  if (RegExp(r'[a-z]').hasMatch(pass)) count++;

  // Проверка наличия заглавной буквы
  if (RegExp(r'[A-Z]').hasMatch(pass)) count++;

  // Проверка наличия цифры
  if (RegExp(r'[0-9]').hasMatch(pass)) count++;

  // Возвращаем прогресс (каждое условие = 0.25)
  return count / 4;
}

String? durationListIntToTime(
  List<int> duration,
  String language,
) {
  try {
    // Суммируем все длительности из списка
    int totalDuration = duration.fold(0, (sum, item) => sum + item);

    // Определяем обозначения в зависимости от языка
    final Map<String, String> labels = {
      'hour': language == 'de' ? 'Stunde' : 'hour',
      'hours': language == 'de' ? 'Stunden' : 'hours',
      'day': language == 'de' ? 'Tag' : 'day',
      'days': language == 'de' ? 'Tage' : 'days',
      'week': language == 'de' ? 'Woche' : 'week',
      'weeks': language == 'de' ? 'Wochen' : 'weeks',
    };

    // Конвертируем общее количество миллисекунд в различные единицы времени
    double minutes = totalDuration / (1000 * 60);
    double hours = minutes / 60;
    double days = hours / 24;
    double weeks = days / 7;

    // Форматирование с учетом правил округления
    if (weeks >= 1) {
      if (days % 7 >= 5) {
        // Если остаток 5 дней или больше, округляем до следующей недели
        int weekCount = (weeks + 1).floor();
        String label = weekCount == 1 ? labels['week']! : labels['weeks']!;
        return '$weekCount $label';
      } else {
        int weekCount = weeks.floor();
        String label = weekCount == 1 ? labels['week']! : labels['weeks']!;
        return '$weekCount $label';
      }
    }

    if (days >= 1) {
      if (hours % 24 >= 12) {
        // Если остаток 12 часов или больше, округляем до следующего дня
        int dayCount = (days + 1).floor();
        String label = dayCount == 1 ? labels['day']! : labels['days']!;
        return '$dayCount $label';
      } else {
        int dayCount = days.floor();
        String label = dayCount == 1 ? labels['day']! : labels['days']!;
        return '$dayCount $label';
      }
    }

    if (hours >= 1) {
      if (minutes % 60 >= 30) {
        // Если остаток 30 минут или больше, округляем до следующего часа
        int hourCount = (hours + 1).floor();
        String label = hourCount == 1 ? labels['hour']! : labels['hours']!;
        return '$hourCount $label';
      } else {
        int hourCount = hours.floor();
        String label = hourCount == 1 ? labels['hour']! : labels['hours']!;
        return '$hourCount $label';
      }
    }

    // Для минут
    int minuteCount = (minutes + 0.5).ceil(); // Округляем вверх
    return '$minuteCount min'; // Всегда используем сокращенную форму для минут
  } catch (e) {
    return null;
  }
}

bool emailFormatCheck(String? email) {
  if (email == null || email.isEmpty) {
    return false;
  }

  // Обновленное регулярное выражение, которое учитывает:
  // - символ + в локальной части
  // - более длинные доменные зоны (например, .museum)
  // - поддержку международных доменов
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

  // Фильтруем выполненные сезоны, если нужно
  if (hideCompeted && seasonDone != null && seasonDone.isNotEmpty) {
    // Получаем список ID выполненных сезонов
    final completedSeasonIds = seasonDone.map((stat) => stat.seasonId).toSet();

    // Исключаем сезоны, ID которых есть в списке выполненных
    levelFiltered = levelFiltered
        .where((season) => !completedSeasonIds.contains(season.reference.id))
        .toList();

    // Если после фильтрации ничего не осталось
    if (levelFiltered.isEmpty) {
      return null;
    }
  }

  // Then filter by language only for specific languages
  switch (filterAppstate.toLowerCase()) {
    case 'en':
      final filtered =
          levelFiltered.where((season) => season.en == true).toList();
      return filtered.isEmpty ? null : filtered;
    case 'de':
      final filtered =
          levelFiltered.where((season) => season.de == true).toList();
      return filtered.isEmpty ? null : filtered;
    default:
      return levelFiltered;
  }
}

String? durationIntToTime(
  int duration,
  String language,
) {
  try {
    // Определяем обозначения в зависимости от языка
    final Map<String, String> labels = {
      'minute': language == 'de' ? 'min' : 'min', // Сокращенная форма
      'minutes': language == 'de' ? 'min' : 'min', // Сокращенная форма
      'hour': language == 'de' ? 'Stunde' : 'hour',
      'hours': language == 'de' ? 'Stunden' : 'hours',
      'day': language == 'de' ? 'Tag' : 'day',
      'days': language == 'de' ? 'Tage' : 'days',
      'week': language == 'de' ? 'Woche' : 'week',
      'weeks': language == 'de' ? 'Wochen' : 'weeks',
    };

    // Конвертируем миллисекунды в различные единицы времени
    double minutes = duration / (1000 * 60);
    double hours = minutes / 60;
    double days = hours / 24;
    double weeks = days / 7;

    // Форматирование с учетом правил округления
    if (weeks >= 1) {
      if (days % 7 >= 5) {
        // Если остаток 5 дней или больше, округляем до следующей недели
        int weekCount = (weeks + 1).floor();
        String label = weekCount == 1 ? labels['week']! : labels['weeks']!;
        return '$weekCount $label';
      } else {
        int weekCount = weeks.floor();
        String label = weekCount == 1 ? labels['week']! : labels['weeks']!;
        return '$weekCount $label';
      }
    }

    if (days >= 1) {
      if (hours % 24 >= 12) {
        // Если остаток 12 часов или больше, округляем до следующего дня
        int dayCount = (days + 1).floor();
        String label = dayCount == 1 ? labels['day']! : labels['days']!;
        return '$dayCount $label';
      } else {
        int dayCount = days.floor();
        String label = dayCount == 1 ? labels['day']! : labels['days']!;
        return '$dayCount $label';
      }
    }

    if (hours >= 1) {
      if (minutes % 60 >= 30) {
        // Если остаток 30 минут или больше, округляем до следующего часа
        int hourCount = (hours + 1).floor();
        String label = hourCount == 1 ? labels['hour']! : labels['hours']!;
        return '$hourCount $label';
      } else {
        int hourCount = hours.floor();
        String label = hourCount == 1 ? labels['hour']! : labels['hours']!;
        return '$hourCount $label';
      }
    }

    // Для минут
    int minuteCount = (minutes + 0.5).ceil(); // Округляем вверх
    return '$minuteCount min'; // Всегда используем сокращенную форму для минут
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

  // Если level null или 0, используем дефолтное значение 1
  final actualLevel = (level == null || level == 0) ? 1 : level;

  // Filter by level first
  var levelFiltered =
      seasons.where((season) => season.level == actualLevel).toList();
  if (levelFiltered.isEmpty) {
    return null;
  }

  // Если нет статистики, возвращаем все сезоны указанного уровня
  if ((seasonDone == null || seasonDone.isEmpty) &&
      (workoutDone == null || workoutDone.isEmpty)) {
    return levelFiltered;
  }

  // Получаем ID выполненных и начатых сезонов
  final completedSeasonIds =
      seasonDone?.map((stat) => stat.seasonId).toSet() ?? {};

  final startedSeasonIds =
      workoutDone?.map((workout) => workout.seasonId).toSet() ?? {};

  // Объединяем множества ID выполненных и начатых сезонов
  final allTouchedSeasonIds = {...completedSeasonIds, ...startedSeasonIds};

  // Исключаем все сезоны, которые есть в списке выполненных или начатых
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

    // Сохраняем лучший результат для каждого воркаута
    if (!bestScores.containsKey(workoutId) ||
        bestScores[workoutId]! < totalScore) {
      bestScores[workoutId] = totalScore;
    }
  }

  // Суммируем лучшие результаты
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

  // Фильтруем воркауты текущего сезона
  final seasonWorkouts =
      workoutDone.where((workout) => workout.seasonId == seasonId);

  // Группируем воркауты по их ID и подсчитываем количество выполнений
  final workoutCompletions = <String, int>{};

  for (var workout in seasonWorkouts) {
    workoutCompletions[workout.workoutId] =
        (workoutCompletions[workout.workoutId] ?? 0) + 1;
  }

  // Проверяем:
  // 1. Количество уникальных воркаутов равно workoutCount
  // 2. Каждый воркаут выполнен минимум 3 раза
  return workoutCompletions.length == workoutCount &&
      workoutCompletions.values.every((count) => count >= 3);
}

double workoutSeasonProgress(
  List<WorkoutStatisticStruct>? workoutDone,
  String seasonId,
  int? workoutCount,
) {
  // Базовые проверки
  if (workoutDone == null ||
      seasonId.isEmpty ||
      workoutCount == null ||
      workoutCount == 0) {
    return 0.0;
  }

  // Фильтруем воркауты текущего сезона
  final seasonWorkouts =
      workoutDone.where((workout) => workout.seasonId == seasonId);

  // Группируем воркауты по их ID и подсчитываем количество выполнений
  final workoutCompletions = <String, int>{};

  for (var workout in seasonWorkouts) {
    workoutCompletions[workout.workoutId] =
        (workoutCompletions[workout.workoutId] ?? 0) + 1;
  }

  // Подсчитываем прогресс для каждого воркаута
  double totalProgress = 0.0;

  for (var count in workoutCompletions.values) {
    // Для каждого воркаута максимум 3 повторения
    double workoutProgress = math.min(count / 3, 1.0);
    totalProgress += workoutProgress;
  }

  // Добавляем учет недостающих воркаутов
  int missingWorkouts = workoutCount - workoutCompletions.length;

  // Вычисляем общий прогресс
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

bool seasonsDone(
  List<SeasonStatisticStruct>? seasonDone,
  int level,
  int? seasonCount,
) {
  // Проверяем на null и пустоту
  if (seasonDone == null ||
      seasonDone.isEmpty ||
      level <= 0 ||
      seasonCount == null ||
      seasonCount == 0) {
    return false;
  }

  // Получаем количество уникальных выполненных сезонов для этого левела
  final completedUniqueSeasons = seasonDone
      .where((season) => season.seasonLevel == level)
      .map((season) => season.seasonId)
      .toSet() // Преобразуем в Set для получения уникальных значений
      .length;

  // Сравниваем количество уникальных выполненных сезонов с общим количеством
  return completedUniqueSeasons == seasonCount;
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

  // Создаем Set для хранения уникальных пользователей
  Set<DocumentReference> uniqueUsers = {};

  for (final record in progress) {
    // Проверяем есть ли у записи workout_done с нужными seasonId и workoutId
    final hasWorkout = record.workoutDone?.any((workout) =>
            workout.seasonId == seasonId && workout.workoutId == workoutId) ??
        false;

    // Если есть - добавляем пользователя в Set
    if (hasWorkout && record.user != null) {
      uniqueUsers.add(record.user!);
    }
  }

  // Возвращаем количество уникальных пользователей
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

bool workoutNoExistOrNotDone(
  List<WorkoutStatisticStruct>? workoutDone,
  String workoutId,
  String seasonId,
) {
  // Базовые проверки
  if (workoutDone == null || seasonId.isEmpty) {
    return false;
  }

  // Получаем все пройденные воркауты этого сезона
  final completedWorkouts =
      workoutDone.where((workout) => workout.seasonId == seasonId);

  // Подсчитываем количество выполнений конкретного воркаута
  final currentWorkoutCount = completedWorkouts
      .where((workout) => workout.workoutId == workoutId)
      .length;

  // Проверяем есть ли другие пройденные воркауты в этом сезоне
  final hasOtherWorkouts =
      completedWorkouts.any((workout) => workout.workoutId != workoutId);

  // Если это новый воркаут
  if (currentWorkoutCount == 0) {
    // Разрешаем только если нет других пройденных воркаутов
    return !hasOtherWorkouts;
  } else {
    // Если это уже начатый воркаут, разрешаем только если он пройден менее 3 раз
    return currentWorkoutCount < 3;
  }
}

int userSeasonPassed(
  List<ProgressRecord>? progress,
  String seasonId,
) {
  if (progress == null || progress.isEmpty) return 0;

  // Создаем Set для хранения уникальных пользователей
  Set<DocumentReference> uniqueUsers = {};

  for (final record in progress) {
    // Проверяем есть ли у записи season_done с нужным seasonId
    final hasSeason =
        record.seasonDone?.any((season) => season.seasonId == seasonId) ??
            false;

    // Если есть - добавляем пользователя в Set
    if (hasSeason && record.user != null) {
      uniqueUsers.add(record.user!);
    }
  }

  // Возвращаем количество уникальных пользователей
  return uniqueUsers.length ?? 0;
}

String pricePeriod(
  String price,
  int period,
  String monthPrice,
  bool increase,
) {
  // Вспомогательная функция для корректной обработки чисел с разделителями
  String cleanNumber(String price) {
    // Удаляем все символы кроме цифр, точек и запятых
    String cleaned = price.replaceAll(RegExp(r'[^\d.,]'), '');

    // Находим позиции разделителей
    int commaIndex = cleaned.lastIndexOf(',');
    int dotIndex = cleaned.lastIndexOf('.');

    // Если есть оба разделителя
    if (commaIndex != -1 && dotIndex != -1) {
      // Используем последний как десятичный, удаляем остальные
      if (commaIndex > dotIndex) {
        // Если запятая последняя - она десятичный разделитель
        cleaned = cleaned.replaceAll('.', '').replaceAll(',', '.');
      } else {
        // Если точка последняя - она десятичный разделитель
        cleaned = cleaned.replaceAll(',', '');
      }
    }
    // Если только запятая - заменяем на точку
    else if (commaIndex != -1) {
      cleaned = cleaned.replaceAll(',', '.');
    }

    return cleaned;
  }

  if (monthPrice == "0") {
    if (period == 1) {
      return price.contains('₽') ? price.replaceAll('₽', 'RUB') : price;
    }

    // Очищаем строку цены и преобразуем в число
    String numStr = cleanNumber(price);
    if (numStr.isEmpty) {
      return price.contains('₽') ? price.replaceAll('₽', 'RUB') : price;
    }

    double? numValue = double.tryParse(numStr);
    if (numValue == null || numValue == 0) {
      return price.contains('₽') ? price.replaceAll('₽', 'RUB') : price;
    }

    // Округляем до 2 знаков после запятой для избежания проблем с плавающей точкой
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
    // Очищаем строки цен и преобразуем в числа
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

    // Округляем значения для точности
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

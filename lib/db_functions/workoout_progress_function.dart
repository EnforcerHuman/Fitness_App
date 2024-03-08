import 'package:hive_flutter/hive_flutter.dart';
import 'package:strongify/db_model/model.dart';

Future<void> addprogress(WorkoutProgres value) async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');
  progressdb.put(value.Date, value);
}

Future<List<WorkoutProgres>> retrieveLast7DaysProgress(String date) async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');

  final currentDate = DateTime.parse(date);
  print('$currentDate');

  // 1
  final last7Days = currentDate.subtract(const Duration(days: 8));

  //2
  final progressList = progressdb.values.where((progres) {
    try {
      final progressDate = DateTime.parse(progres.Date);
      return progressDate.isAfter(last7Days) &&
          progressDate.isBefore(currentDate.add(const Duration(days: 1)));
    } catch (e) {
      print('Error parsing date: ${progres.Date}');
      return false;
    }
  }).toList();

  print('Stored Progress for the last 7 days:');
  for (var progress in progressList) {
    print('${progress.Date}: ${progress.progress}');
  }

  await progressdb.close();

  return progressList;
}

Future<void> printAllProgress() async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');

  // Get all keys (dates) from the box
  final keys = progressdb.keys;

  // Iterate through the keys and print corresponding values
  for (final key in keys) {
    final value = progressdb.get(key);
    print('Date: $key, Progress: $value');
  }
}

Future<double> printProgressForDate(String dateString) async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');

  // Get progress for the specified date
  final progressForDate = progressdb.get(dateString);

  if (progressForDate != null) {
    print('Progress for Date $dateString: $progressForDate');
    return progressForDate.progress;
  } else {
    print('No progress found for Date $dateString');
    return 0;
  }
}

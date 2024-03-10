import 'package:hive_flutter/hive_flutter.dart';
import 'package:strongify/db_model/model.dart';

Future<void> addprogress(WorkoutProgres value) async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');
  progressdb.put(value.Date, value);
}

Future<List<WorkoutProgres>> retrieveLast7DaysProgress(String date) async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');

  final currentDate = DateTime.parse(date);

  // 1
  final last7Days = currentDate.subtract(const Duration(days: 8));

  //2
  final progressList = progressdb.values.where((progres) {
    try {
      final progressDate = DateTime.parse(progres.Date);
      return progressDate.isAfter(last7Days) &&
          progressDate.isBefore(currentDate.add(const Duration(days: 1)));
    } catch (e) {
      return false;
    }
  }).toList();

  await progressdb.close();

  return progressList;
}

Future<void> printAllProgress() async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');

  // Get all keys (dates) from the box
  final keys = progressdb.keys;

  // Iterate through the keys and print corresponding values
  for (final key in keys) {
    progressdb.get(key);
  }
}

Future<double> printProgressForDate(String dateString) async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');

  // Get progress for the specified date
  final progressForDate = progressdb.get(dateString);

  if (progressForDate != null) {
    return progressForDate.progress;
  } else {
    return 0;
  }
}

//sleep functions

import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:strongify/db_model/model.dart';

Future<void> addsleepschedule(SleepProgres value) async {
  final sleepScheduleScreendb =
      await Hive.openBox<SleepProgres>('sleepschedule');
  sleepScheduleScreendb.put(value.date, value);
}

Future<SleepProgres?> retriveSleepSchedule(String date) async {
  final sleepProgresScheduledb =
      await Hive.openBox<SleepProgres>('sleepschedule');
  final test = sleepProgresScheduledb.get(date);

  return test;
}

Future<void> deleteSleepSchedule(String date) async {
  // ignore: non_constant_identifier_names
  final SleepScheduleScreendb =
      await Hive.openBox<SleepProgres>('sleepschedule');

  if (SleepScheduleScreendb.containsKey(date)) {
    await SleepScheduleScreendb.delete(date);
  } else {}
}

Future<double> retriveSleepHours(String date) async {
  // ignore: non_constant_identifier_names
  final SleepProgresScheduledb =
      await Hive.openBox<SleepProgres>('sleepschedule');
  final test = SleepProgresScheduledb.get(date);
  return test!.sleephours;
}

Future<List<double?>> retrieveLast7DaysSleepSchedule() async {
  final sleepProgresScheduledb =
      await Hive.openBox<SleepProgres>('sleepschedule');

  // Get the current date
  DateTime currentDate = DateTime.now();

  List<double?> sleepHoursList = [];

  // Retrieve, print, and collect sleep schedule for the last 7 days
  for (int i = 1; i < 8; i++) {
    // Calculate the date for the current iteration
    DateTime dateToRetrieve = currentDate.subtract(Duration(days: i));
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateToRetrieve);

    // Retrieve sleep schedule for the current date
    SleepProgres? sleepProgress =
        // ignore: await_only_futures
        await sleepProgresScheduledb.get(formattedDate);

    // Add sleep hours to the list
    sleepHoursList.add(sleepProgress?.sleephours);
  }

  // Return the list of sleep hours for the last 7 days
  return sleepHoursList;
}

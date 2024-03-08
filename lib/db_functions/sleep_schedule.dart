//sleep functions

import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:strongify/db_model/model.dart';

Future<void> addsleepschedule(SleepProgres value) async {
  final SleepScheduleScreendb =
      await Hive.openBox<SleepProgres>('sleepschedule');
  SleepScheduleScreendb.put(value.date, value);
  print(SleepScheduleScreendb.values);
}

Future<SleepProgres?> retriveSleepSchedule(String date) async {
  final SleepProgresScheduledb =
      await await Hive.openBox<SleepProgres>('sleepschedule');
  final test = await SleepProgresScheduledb.get(date);
  print(test);
  return test;
}

Future<void> deleteSleepSchedule(String date) async {
  // ignore: non_constant_identifier_names
  final SleepScheduleScreendb =
      await Hive.openBox<SleepProgres>('sleepschedule');

  if (SleepScheduleScreendb.containsKey(date)) {
    await SleepScheduleScreendb.delete(date);
    print('Deleted sleep schedule for date: $date');
  } else {
    print('No sleep schedule found for date: $date');
  }
}

Future<SleepProgres?> retriveSleepHours(String date) async {
  final SleepProgresScheduledb =
      await await Hive.openBox<SleepProgres>('sleepschedule');
  final test = await SleepProgresScheduledb.get(date);
  print(test!.sleephours);
  return test;
}

Future<List<double?>> retrieveLast7DaysSleepSchedule() async {
  final SleepProgresScheduledb =
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
        await SleepProgresScheduledb.get(formattedDate);

    // Print sleep schedule
    print('Sleep schedule for $formattedDate:');
    print(sleepProgress?.sleephours);
    print('---------------------');

    // Add sleep hours to the list
    sleepHoursList.add(sleepProgress?.sleephours);
  }

  // Return the list of sleep hours for the last 7 days
  return sleepHoursList;
}

//schedule data base

import 'package:hive_flutter/hive_flutter.dart';
import 'package:strongify/db_model/model.dart';

Future<void> addschedule(Schedule value) async {
  final scheduledb = await Hive.openBox<List>('schedules');
  final dateKey = value.date;
  List<Schedule> schedulesForDate = [];

  // Check if there's already a list for that date
  if (scheduledb.containsKey(dateKey)) {
    final existingSchedules = scheduledb.get(dateKey);
    schedulesForDate.addAll(existingSchedules!.cast<Schedule>());
  }

  //for test purpose
  // Future<void> retriveDate(date) async {
  //   final scheduledb = await Hive.openBox<Schedule>('schedules');

  // }

  schedulesForDate.add(value);

  // Put the updated list back into the box
  await scheduledb.put(dateKey, schedulesForDate);
}

Future<List?> retrieveSchedulesForDate(String date) async {
  final scheduledb = await Hive.openBox<List>('schedules');
  final schedulesForDate = scheduledb.get(date);
  return schedulesForDate;
}

Future<void> deleteSchedule(String date, int index) async {
  final scheduledb = await Hive.openBox<List>('schedules');

  if (scheduledb.containsKey(date)) {
    List<Schedule> schedulesForDate = scheduledb.get(date)!.cast<Schedule>();

    if (index >= 0 && index < schedulesForDate.length) {
      schedulesForDate.removeAt(index);

      // Put the updated list back into the box
      await scheduledb.put(date, schedulesForDate);
    } else {}
  } else {}
}

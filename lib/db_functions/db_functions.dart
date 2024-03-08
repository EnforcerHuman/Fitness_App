import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:strongify/db_model/model.dart';

Future<void> adduserdetails(UserDetails value) async {
  final userDetailsDB = await Hive.openBox<UserDetails>('user_details');
  userDetailsDB.put(value.hashCode, value);
}

Future<List> retriveData() async {
  final userDetailsBox = await Hive.openBox<UserDetails>('user_details');
  final List<UserDetails> users = userDetailsBox.values.toList();
  return users;
}

//edit user details
Future<void> edituserdetails({
  required String newGender,
  required int newAge,
  required int newWeight,
  required int newHeight,
}) async {
  final userDetailsBox = await Hive.openBox<UserDetails>('user_details');

  if (userDetailsBox.isNotEmpty) {
    userDetailsBox.putAt(
        0,
        UserDetails(
          gender: newGender,
          age: newAge,
          weight: newWeight,
          height: newHeight,
        ));

    print('User details edited successfully.');
  } else {
    print('No user found.');
  }

  await userDetailsBox.close();
}

///---------------------------------------------------------------------------------------------------
//schedule data base

// Future<void> addschedule(Schedule value) async {
//   final scheduledb = await Hive.openBox<List>('schedules');
//   final dateKey = value.date;
//   List<Schedule> schedulesForDate = [];

//   // Check if there's already a list for that date
//   if (scheduledb.containsKey(dateKey)) {
//     final existingSchedules = scheduledb.get(dateKey);
//     schedulesForDate.addAll(existingSchedules!.cast<Schedule>());
//   }

//   //for test purpose
//   Future<void> retriveDate(date) async {
//     final scheduledb = await Hive.openBox<Schedule>('schedules');
//     final test = scheduledb.get(date);
//     print(test);
//   }

//   schedulesForDate.add(value);

//   // Put the updated list back into the box
//   await scheduledb.put(dateKey, schedulesForDate);
//   print('Schedule added');
// }

// Future<List?> retrieveSchedulesForDate(String date) async {
//   final scheduledb = await Hive.openBox<List>('schedules');
//   final schedulesForDate = scheduledb.get(date);

//   if (schedulesForDate != null) {
//     List<Schedule> schedules = schedulesForDate.cast<Schedule>();
//     for (Schedule schedule in schedules) {
//       print(schedule);
//     }
//   }
//   return schedulesForDate;
// }

// Future<void> deleteSchedule(String date, int index) async {
//   final scheduledb = await Hive.openBox<List>('schedules');

//   if (scheduledb.containsKey(date)) {
//     List<Schedule> schedulesForDate = scheduledb.get(date)!.cast<Schedule>();

//     if (index >= 0 && index < schedulesForDate.length) {
//       schedulesForDate.removeAt(index);

//       // Put the updated list back into the box
//       await scheduledb.put(date, schedulesForDate);

//       print('Schedule deleted');
//     } else {
//       print('Invalid index for deletion');
//     }
//   } else {
//     print('No schedules found for the given date');
//   }
// }

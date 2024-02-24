import 'package:hive_flutter/hive_flutter.dart';
import 'package:strongify/db_model/model.dart';

Future<void> adduserdetails(UserDetails value) async {
  final userDetailsDB = await Hive.openBox<UserDetails>('user_details');
  userDetailsDB.put(value.hashCode, value);
}

Future<List> retriveData() async {
  final userDetailsBox = await Hive.openBox<UserDetails>('user_details');
  final List<UserDetails> users = userDetailsBox.values.toList();
  print(users[0].gender);
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

// Future<void> addschedule(Schedule value) async {
//   final scheduledb = await Hive.openBox<Schedule>('schedules');
//   scheduledb.put(value.date, value);
//   print('added ');
// }

// Future<void> retriveschedules() async {
//   final scheduledb = await Hive.openBox<Schedule>('schedules');

//   // Retrieve all schedules using the values property
//   List<Schedule> allSchedules = scheduledb.values.toList();

//   // Print all retrieved schedules
//   for (var i = 0; i < allSchedules.length; i++) {
//     print(allSchedules[i]);
//   }
//   print('Length is ${allSchedules.length}');
// }

// Future<void> retriveDate(date) async {
//   final scheduledb = await Hive.openBox<Schedule>('schedules');
//   final test = scheduledb.get(date);
//   print(test);
// }
Future<void> addschedule(Schedule value) async {
  final scheduledb = await Hive.openBox<List>('schedules');
  final dateKey = value
      .date; // Ensure this is a string or a format that can be used as a key.
  List<Schedule> schedulesForDate = [];

  // Check if there's already a list for that date
  if (scheduledb.containsKey(dateKey)) {
    final existingSchedules = scheduledb.get(dateKey);
    schedulesForDate.addAll(existingSchedules!.cast<Schedule>());
  }

  // Add the new schedule to the list
  schedulesForDate.add(value);

  // Put the updated list back into the box
  await scheduledb.put(dateKey, schedulesForDate);
  print('Schedule added');
}

Future<List?> retrieveSchedulesForDate(String date) async {
  final scheduledb = await Hive.openBox<List>('schedules');
  final schedulesForDate = scheduledb.get(date);

  if (schedulesForDate != null) {
    List<Schedule> schedules = schedulesForDate.cast<Schedule>();
    // Process your schedules list
    for (Schedule schedule in schedules) {
      print(schedule); // Or however you want to handle the schedule object
    }
  }
  return schedulesForDate;
}

Future<void> deleteSchedule() async {}

//Progress database functions
Future<void> addprogress(WorkoutProgres value) async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');
  progressdb.put(value.Date, value);
  // await progressdb.close();
}

Future<void> retriveprogress() async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');
  final progresslist = progressdb.values.toList();
  print('progresslist $progresslist');
}

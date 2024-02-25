import 'package:hive_flutter/hive_flutter.dart';
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

Future<void> retriveDate(date) async {
  final scheduledb = await Hive.openBox<Schedule>('schedules');
  final test = scheduledb.get(date);
  print(test);
}

Future<void> addschedule(Schedule value) async {
  final scheduledb = await Hive.openBox<List>('schedules');
  final dateKey = value.date;
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

//******Progress database functions********//

Future<void> addprogress(WorkoutProgres value) async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');
  progressdb.put(value.Date, value);
}

Future<double> retriveprogress() async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');
  final progressList = progressdb.values.toList();
  // print('progresslist $progresslist');

  print('Stored Progress:');
  for (var progress in progressList) {
    print('${progress.Date}: ${progress.progress}');
  }
  return progressList[0].progress;
}

//terive data fr last 7 days
Future<List<WorkoutProgres>> retrieveLast7DaysProgress(String date) async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');

  // Get the current date
  final currentDate = DateTime.parse(date);

  // Calculate the date 7 days ago
  final last7Days = currentDate.subtract(Duration(days: 8));

  // Retrieve progress list for the last 7 days (including the current date)
  final progressList = progressdb.values.where((progress) {
    try {
      final progressDate = DateTime.parse(progress.Date);
      return progressDate.isAfter(last7Days) &&
          progressDate.isBefore(currentDate
              .add(Duration(days: 1))); // Add 1 day to include the current date
    } catch (e) {
      print('Error parsing date: ${progress.Date}');
      return false;
    }
  }).toList();

  // Print stored progress for the last 7 days
  print('Stored Progress for the last 7 days:');
  for (var progress in progressList) {
    print('${progress.Date}: ${progress.progress}');
  }

  // Close the box after use
  await progressdb.close();

  return progressList;
}

Future<double> retrieveProgressForSpecificDay(String targetDate) async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');

  final targetDateTime = DateTime.parse(targetDate);

  final progress = progressdb.values.firstWhere(
    (progress) =>
        DateTime.parse(progress.Date).isAtSameMomentAs(targetDateTime),
  );

  // ignore: unnecessary_null_comparison
  if (progress != null) {
    print('Progress for $targetDate: ${progress.progress}');
    print(progress.progress);
    return progress.progress;
  } else {
    print('No progress found for $targetDate');
    return 0;
  }
}

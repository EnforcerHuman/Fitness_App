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
//schedule data base

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
  Future<void> retriveDate(date) async {
    final scheduledb = await Hive.openBox<Schedule>('schedules');
    final test = scheduledb.get(date);
    print(test);
  }

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
    for (Schedule schedule in schedules) {
      print(schedule);
    }
  }
  return schedulesForDate;
}

//******Progress database functions********

Future<void> addprogress(WorkoutProgres value) async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');
  progressdb.put(value.Date, value);
}

Future<double> retriveprogress() async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');
  final progressList = progressdb.values.toList();

  print('Stored Progress:');
  for (var progress in progressList) {
    print('${progress.Date}: ${progress.progress}');
  }
  return progressList[0].progress;
}

Future<List<WorkoutProgres>> retrieveLast7DaysProgress(String date) async {
  final progressdb = await Hive.openBox<WorkoutProgres>('progress');

  final currentDate = DateTime.parse(date);

  // 1
  final last7Days = currentDate.subtract(const Duration(days: 8));

  //2
  final progressList = progressdb.values.where((progress) {
    try {
      final progressDate = DateTime.parse(progress.Date);
      return progressDate.isAfter(last7Days) &&
          progressDate.isBefore(currentDate.add(const Duration(days: 1)));
    } catch (e) {
      print('Error parsing date: ${progress.Date}');
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

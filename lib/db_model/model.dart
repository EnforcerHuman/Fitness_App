import 'package:hive_flutter/hive_flutter.dart';

part 'model.g.dart';

@HiveType(typeId: 1)
class UserDetails {
  @HiveField(0)
  final String gender;

  @HiveField(1)
  final int age;
  @HiveField(2)
  final int height;
  @HiveField(3)
  final int weight;
  UserDetails(
      {required this.gender,
      required this.age,
      required this.height,
      required this.weight});
}

@HiveType(typeId: 2)
class Schedule {
  @HiveField(0)
  final String date;
  @HiveField(1)
  final String time;
  @HiveField(2)
  final String workout;
  Schedule({required this.date, required this.time, required this.workout});
  @override
  String toString() {
    return 'Schedule(date: $date, time: $time, workout: $workout)';
  }
}

@HiveType(typeId: 3)
class WorkoutProgres {
  @HiveField(0)
  final double progress;
  @HiveField(1)
  final String Date;
  WorkoutProgres(this.progress, this.Date);
  @override
  String toString() {
    return 'Date : $Date ,Progress : $progress';
  }
}

@HiveType(typeId: 4)
class SleepProgres {
  @HiveField(0)
  final String date;
  @HiveField(1)
  final DateTime sleeptime;
  @HiveField(2)
  final DateTime wakeuptime;
  SleepProgres(this.date, this.sleeptime, this.wakeuptime);
  @override
  String toString() {
    return 'Date : $date ,sleeptime : $sleeptime ,wakeup time : $wakeuptime';
  }
}

@HiveType(typeId: 5)
class Photo {
  @HiveField(0)
  final int month;

  @HiveField(1)
  final String imagepath;

  Photo(this.imagepath, this.month);

  @override
  String toString() {
    return 'Month: $month, Image Path: $imagepath';
  }
}

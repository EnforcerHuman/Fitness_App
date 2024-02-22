import 'package:hive/hive.dart';
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

import 'dart:math';
import 'package:intl/intl.dart';
import 'package:strongify/db_functions/sleep_schedule.dart';
import 'package:strongify/db_model/model.dart';

Random random = Random();
String bedtime = '';
String alarmtime = '';
double? totalsleephours;
int minutesofsleep = 0;
int minutesofalarm = 0;
int timeindiactorforalarm = 0;
int timeindicatorforbed = 0;

Future<void> updateSelectedDate(DateTime date) async {
  String formatteddate = DateFormat('yyyy-MM-dd').format(date);
  SleepProgres? sleepSchedule = await retriveSleepSchedule(formatteddate);

  if (sleepSchedule != null) {
    timeindiactorforalarm = sleepSchedule.sleeptime.hour;
    minutesofsleep = sleepSchedule.sleeptime.minute;

    String getalarmtime = DateFormat('h:mm a').format(sleepSchedule.wakeuptime);
    timeindicatorforbed = sleepSchedule.wakeuptime.hour;
    minutesofalarm = sleepSchedule.wakeuptime.minute;
    String getbedtime = DateFormat('h:mm a').format(sleepSchedule.sleeptime);

    alarmtime = getalarmtime;
    bedtime = getbedtime;
  } else {
    alarmtime = 'Set your schedule';
    bedtime = 'Set your schedule';
  }
}

int? totalhour = 0;
int? totalminutes = 0;
Future<void> getsleephours(DateTime date) async {
  String formatteddate = DateFormat('yyyy-MM-dd').format(date);
  double totalsleephours = await retriveSleepHours(formatteddate);

  totalhour = totalsleephours.floor();
  totalminutes = ((totalsleephours - totalhour!) * 10).toInt();
}

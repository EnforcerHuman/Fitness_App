import 'dart:math';
import 'package:intl/intl.dart';
import 'package:strongify/db/db_functions.dart';
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
    print('minutes of sleep : $minutesofsleep');
    String getalarmtime = DateFormat('HH:mm').format(sleepSchedule.wakeuptime);
    timeindicatorforbed = sleepSchedule.wakeuptime.hour;
    minutesofalarm = sleepSchedule.wakeuptime.minute;
    String getbedtime = DateFormat('HH:mm').format(sleepSchedule.sleeptime);

    if (timeindiactorforalarm >= 12) {
      alarmtime = '$getalarmtime, A.M';
    } else {
      alarmtime = '$getalarmtime, P.M';
    }
    if (timeindicatorforbed >= 12) {
      bedtime = '$getbedtime, A.M';
    } else {
      bedtime = '$getbedtime, P.M';
    }
  } else {
    alarmtime = 'Set your schedule';
    bedtime = 'Set your schedule';
  }
  // totalsleephours = double.parse('$timeindiactorforalarm.$timeindicatorforbed');
  // print('total sleep hours : $totalsleephours');
}

int? totalhour;
int? totalminutes;
Future<void> getsleephours() async {
  totalhour = timeindicatorforbed - timeindiactorforalarm;
  totalminutes = minutesofsleep - minutesofalarm;
  print(totalhour);
  // totalsleephours = double.parse('$totalhour.$totalminutes');
}

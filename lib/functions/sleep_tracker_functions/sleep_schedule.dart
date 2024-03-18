import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:strongify/db_functions/sleep_schedule.dart';
import 'package:strongify/db_model/model.dart';

Random random = Random();
ValueNotifier<String> bedtime = ValueNotifier<String>('');
ValueNotifier<String> alarmtime = ValueNotifier<String>('');
ValueNotifier<String> currentdatebedtime =
    ValueNotifier<String>('set your sleep schedule');
ValueNotifier<String> currentdatealarmtime =
    ValueNotifier<String>('set your sleep schedule');

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

    alarmtime.value = getalarmtime;
    bedtime.value = getbedtime;
  } else {
    alarmtime.value = 'Set your schedule';
    bedtime.value = 'Set your schedule';
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

Future<void> retrivesleeptiming(DateTime date) async {
  String formatteddate = DateFormat('yyyy-MM-dd').format(date);
  SleepProgres? sleepSchedule = await retriveSleepSchedule(formatteddate);

  if (sleepSchedule != null) {
    timeindiactorforalarm = sleepSchedule.sleeptime.hour;
    String getbedtime = DateFormat('h:mm a').format(sleepSchedule.sleeptime);
    currentdatebedtime.value = getbedtime;

    timeindiactorforalarm = sleepSchedule.sleeptime.hour;
    minutesofsleep = sleepSchedule.sleeptime.minute;

    String getalarmtime = DateFormat('h:mm a').format(sleepSchedule.wakeuptime);
    currentdatealarmtime.value = getalarmtime;
  } else {
    currentdatealarmtime.value = 'set your schedule';
    currentdatebedtime.value = 'set your schedule';
  }
}

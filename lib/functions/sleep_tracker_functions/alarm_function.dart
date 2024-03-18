import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';

Future<void> setAlarm(List<DateTime> dates) async {
  for (var date in dates) {
    final alarmDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      date.hour,
      date.minute,
    );

    final alarmSettings = AlarmSettings(
        id: dates.indexOf(date) + 1,
        dateTime: alarmDateTime,
        notificationTitle: 'Alarm',
        notificationBody: 'Time to wake up!',
        assetAudioPath: "assets/iphone_alarm.mp3",
        enableNotificationOnKill: false,
        androidFullScreenIntent: true,
        vibrate: false,
        volume: 1);

    await Alarm.set(alarmSettings: alarmSettings);
  }
}

Future<void> stopAlarm(int id) async {
  await Alarm.stop(id);
}

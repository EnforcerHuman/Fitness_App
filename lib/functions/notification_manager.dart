import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

int notificationInterval = 1;
late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

Future<void> initLocalNotifications() async {
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('welocome');

  InitializationSettings initializationSettings = const InitializationSettings(
    android: androidSettings,
  );

  await _flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
}

Future<void> showNotification() async {
  DateTime now = DateTime.now();
  DateTime startTime = DateTime(now.year, now.month, now.day, 6, 0, 0);
  DateTime endTime = DateTime(now.year, now.month, now.day, 20, 0, 0);

  if (now.isAfter(startTime) && now.isBefore(endTime)) {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '1',
      'water_reminder',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
      actions: [
        AndroidNotificationAction(
          'action_button_id',
          '',
        ),
      ],
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
      0,
      'Hello, user!',
      'It\'s time to DRINK WATER ',
      platformChannelSpecifics,
      payload: 'notification_payload',
    );
  }
}

void startPeriodicTimer() {
  Timer.periodic(Duration(hours: notificationInterval), (timer) {
    showNotification();
  });
}

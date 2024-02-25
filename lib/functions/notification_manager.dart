import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

int notificationintervel = 1;
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
    'Its time to DRINK WATER ',
    platformChannelSpecifics,
    payload: 'notification_payload',
  );
}

void startPeriodicTimer() {
  Timer.periodic(Duration(minutes: notificationintervel), (timer) {
    showNotification();
    // showWarningDialog(context, 'test', 'test', () {});
  });
}

import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

Future<void> initLocalalarm() async {
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

Future<void> showalarm() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    '2',
    'sleep reminder',
    importance: Importance.defaultImportance,
    priority: Priority.defaultPriority,
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await _flutterLocalNotificationsPlugin.show(
    1,
    'Hello, user!',
    'Its time to Sleep ',
    platformChannelSpecifics,
    payload: 'notification_payload',
  );
}

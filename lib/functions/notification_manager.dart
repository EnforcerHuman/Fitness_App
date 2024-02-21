import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

Future<void> initLocalNotifications() async {
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('welocome');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: androidSettings,
  );

  await _flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
}

Future<void> showNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    '1', //   unique ID for  channel
    'water_reminder',
    importance: Importance.defaultImportance,
    priority: Priority.defaultPriority,
    actions: [
      AndroidNotificationAction(
        'action_button_id',
        'Action Button',
      ),
    ],
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await _flutterLocalNotificationsPlugin.show(
    0, // Notification ID
    'Hello, user!',
    'Its time to DRINK WATER',
    platformChannelSpecifics,
    payload: 'notification_payload',
  );
}

void startPeriodicTimer() {
  Timer.periodic(Duration(hours: 1), (timer) {
    // Show the notification every hour later change it considering user preference
    showNotification();
  });
}

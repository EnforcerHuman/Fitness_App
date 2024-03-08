import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/db_model/model.dart';
import 'package:strongify/functions/notification_manager.dart';
import 'package:strongify/functions/sleep_tracker_functions/alarm_function.dart';

import 'package:strongify/screens/on_boarding/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UserDetailsAdapter().typeId)) {
    Hive.registerAdapter(UserDetailsAdapter());
  }
  if (!Hive.isAdapterRegistered(ScheduleAdapter().typeId)) {
    Hive.registerAdapter(ScheduleAdapter());
  }
  if (!Hive.isAdapterRegistered(WorkoutProgresAdapter().typeId)) {
    Hive.registerAdapter(WorkoutProgresAdapter());
  }

  if (!Hive.isAdapterRegistered(SleepProgresAdapter().typeId)) {
    Hive.registerAdapter(SleepProgresAdapter());
  }
  if (!Hive.isAdapterRegistered(PhotoAdapter().typeId)) {
    Hive.registerAdapter(PhotoAdapter());
  }
  initLocalNotifications();
  initLocalalarm();
  startPeriodicTimer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strongify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        primaryColor: Tcolor.primaryColor1,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

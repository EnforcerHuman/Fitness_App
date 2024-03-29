import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/db_model/model.dart';
import 'package:strongify/functions/notification_manager.dart';
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
  startPeriodicTimer();
  await Alarm.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strongify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        primaryColor: Tcolor.primaryColor1,
        useMaterial3: true,
      ),
      home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('snapshoterror');
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return const SplashScreen();
            }
            return CircularProgressIndicator();
          }),
    );
  }
}

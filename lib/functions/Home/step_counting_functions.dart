import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<int> steps = ValueNotifier<int>(0);
DateTime lastResetDate = DateTime.now();
late Stream<StepCount> stepCountStream;

//request permission
late Stream<PedestrianStatus> pedestrianStatusStream;
Future<void> requestPermissions() async {
  var status = await Permission.activityRecognition.status;
  if (!status.isGranted) {
    await Permission.activityRecognition.request();
  }
}

Future<void> initPlatformState() async {
  await requestPermissions();
  pedestrianStatusStream = Pedometer.pedestrianStatusStream;

  stepCountStream = Pedometer.stepCountStream;
  stepCountStream.listen(onStepCount).onError(onStepCountError);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  lastResetDate = DateTime.parse(prefs.getString('lastResetDate') ?? '');

  // if (!mounted) return;
}

void onStepCount(StepCount event) {
  steps.value = event.steps;
}

void onStepCountError(error) {
  steps.value = 0;
}

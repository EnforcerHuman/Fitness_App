// import 'package:pedometer/pedometer.dart';
// import 'package:permission_handler/permission_handler.dart';

// String _status = '?';
// late Stream<PedestrianStatus> _pedestrianStatusStream;
// late Stream<StepCount> _stepCountStream;
// Future<void> requestPermissions() async {
//   var status = await Permission.activityRecognition.status;
//   if (!status.isGranted) {
//     await Permission.activityRecognition.request();
//   }
// }

// void onPedestrianStatusChanged(PedestrianStatus event) {
//   print(event);

//   _status = event.status;
// }

// void onPedestrianStatusError(error) {
//   print('onPedestrianStatusError: $error');

//   _status = 'Pedestrian Status not available';

//   print(_status);
// }

// void onStepCountError(error, steps) {
//   print('onStepCountError: $error');

//   steps = 0;
// }

// Future<void> initPlatformState() async {
//   await requestPermissions();
//   _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
//   _pedestrianStatusStream
//       .listen(onPedestrianStatusChanged)
//       .onError(onPedestrianStatusError);

//   _stepCountStream = Pedometer.stepCountStream;
//   _stepCountStream.listen(onStepCount).onError(onStepCountError);

//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   lastResetDate = DateTime.parse(prefs.getString('lastResetDate') ?? '');

//   if (!mounted) return;
// }

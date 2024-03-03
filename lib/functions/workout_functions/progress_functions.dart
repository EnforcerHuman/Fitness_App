import 'package:intl/intl.dart';
import 'package:strongify/db/db_functions.dart';
import 'package:strongify/db_model/model.dart';

// double progressvalue = 2;
// String formatTime(int timeInSeconds) {
//   int minutes = timeInSeconds ~/ 60;
//   int seconds = timeInSeconds % 60;
//   return '$minutes:${seconds.toString().padLeft(2, '0')}';
// }

// Future<void> setprogressvalue() async {
//   String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
//   double existingprogressvalue =
//       await retrieveProgressForSpecificDay('2024-02-29');
//   print('existingprogressvalue $existingprogressvalue');

//   progressvalue = existingprogressvalue + 3.33;
//   print('added progress value $progressvalue');

//   final progress = WorkoutProgres(progressvalue, '2024-02-29');
//   await addprogress(progress);
//   retriveprogress();
// }

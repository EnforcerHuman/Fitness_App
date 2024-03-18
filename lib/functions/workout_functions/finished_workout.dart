import 'package:intl/intl.dart';
import 'package:strongify/db_functions/workoout_progress_function.dart';
import 'package:strongify/db_model/model.dart';

Future<void> setprogressvalue() async {
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  double retrivedvalue = await printProgressForDate(formattedDate);
  final test = WorkoutProgres(retrivedvalue + 3.33, formattedDate);
  await addprogress(test);
}

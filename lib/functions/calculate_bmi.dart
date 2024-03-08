import 'package:strongify/db_functions/db_functions.dart';

Future<String> calculateBMI() async {
  List details = await retriveData();
  int weight = details[0].weight;
  int height = details[0].height;
  double bmi = weight / (height * height);

  // Limit to 3 decimal places
  String formattedBMI = bmi.toStringAsFixed(3);

  return formattedBMI;
}

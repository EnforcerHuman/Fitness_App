import 'package:strongify/db_functions/db_functions.dart';

Future<String> getGender() async {
  List data = await retriveData();
  String gen = data[0].gender.toLowerCase();
  print(gen);
  return gen;
}

//age
Future<String> getAge() async {
  List data = await retriveData();
  String age = data[0].age.toString();
  print(age);
  return age;
}

//height
Future<String> getheight() async {
  List data = await retriveData();
  String height = data[0].height.toString();
  print(height);
  return height;
}

//weight
Future<String> getweight() async {
  List data = await retriveData();
  String weight = data[0].weight.toString();
  print(weight);
  return weight;
}

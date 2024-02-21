import 'package:shared_preferences/shared_preferences.dart';

Future<void> savetarget(String steps, String water) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('steps', steps);
  pref.setString('water', water);
  String steptarget = pref.getString('steps')!;
  String watertarget = pref.getString('water')!;
  print(steptarget);
}

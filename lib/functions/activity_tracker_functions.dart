import 'package:shared_preferences/shared_preferences.dart';

Future<void> savetarget(String steps, String water) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('steps', steps);
  pref.setString('water', water);
  pref.getString('steps')!;
  pref.getString('water')!;
}

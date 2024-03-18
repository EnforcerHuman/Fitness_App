import 'package:flutter/material.dart';
import 'package:strongify/db_functions/get_user_details.dart';
import 'package:strongify/functions/shared_pref.dart';

ValueNotifier<String> height = ValueNotifier<String>('unavailable');
ValueNotifier<String> age = ValueNotifier<String>('unavailable');
ValueNotifier<String> weight = ValueNotifier<String>('unavailable');
ValueNotifier<String> username = ValueNotifier<String>('unavailable');
Future<void> loaduserDetails() async {
  String loadedname = await getusername();
  String loadedage = await getAge();
  String loadedheight = await getheight();
  String loadedweight = await getweight();

  username.value = loadedname;
  age.value = loadedage;
  height.value = loadedheight;
  weight.value = loadedweight;
}

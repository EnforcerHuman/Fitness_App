import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<String> watertargetl = ValueNotifier<String>('unavailable');
ValueNotifier<String> steptarget = ValueNotifier<String>('unavilable');
ValueNotifier<String> drinksuggetion = ValueNotifier<String>('unavilable');
// ValueNotifier<List> waterArr = ValueNotifier<List>([]);
List waterArr = [];

Future<void> gettargets() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  String watertarget1 = pref.getString('water')!;
  watertargetl.value = watertarget1;
  steptarget.value = pref.getString('steps')!;

  double test = double.parse(watertargetl.value);
  drinksuggetion.value = (test / 12).toStringAsFixed(3);
  initializeWaterArr();
}

//initialize water array
void initializeWaterArr() {
  waterArr = [
    {"title": "6am - 8am", "subtitle": '${drinksuggetion.value} L'},
    {"title": "9am - 11am", "subtitle": '${drinksuggetion.value} L'},
    {"title": "11am - 2pm", "subtitle": '${drinksuggetion.value} L'},
    {"title": "2pm - 4pm", "subtitle": '${drinksuggetion.value} L'},
    {"title": "4pm - 6", "subtitle": '${drinksuggetion.value} L'},
  ];
}

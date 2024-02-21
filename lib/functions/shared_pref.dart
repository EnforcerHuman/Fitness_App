import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:strongify/screens/login/signup_screen.dart';

//function to store sign up details
Future<void> storeSignUpDetails(firstname, lastname, email, password) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString("firstname", firstname);
  pref.setString('Lastname', lastname);
  pref.setString("email", email);
  pref.setString("password", password);
  String? mail = pref.getString('email');
  print(mail);
}

//function to check login

Future<bool> checkLogin(String enteredEmail, String enteredPassword) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? storedEmail = prefs.getString('email');
  String? storedPassword = prefs.getString('password');
  print('Stored Email: $storedEmail');
  print('Entered Email: $enteredEmail');
  print('Stored password: $storedPassword');
  print('Entered password: $enteredPassword');
  if (storedEmail == enteredEmail && storedPassword == enteredPassword) {
    prefs.setBool('islogged', true);
    return true;
  } else {
    return false;
  }
}

Future<void> logout(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('islogged', false);
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => SignUpScreen()),
      (route) => false);
}

//to save steps currently unused
Future<void> savesteps(steps) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('steps', steps);
}

//get user name
Future<String> getusername() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  String username = pref.getString('firstname') ?? 'guest';
  return username;
}
//get height

Future<String> getuserheight() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  String username = pref.getString('firstname') ?? 'guest';
  return username;
}

//get weight
Future<String> getuserweight() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  String username = pref.getString('firstname') ?? 'guest';
  return username;
}

//get age


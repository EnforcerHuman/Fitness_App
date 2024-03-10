import 'package:hive_flutter/hive_flutter.dart';
import 'package:strongify/common_widget/snack_bar.dart';
import 'package:strongify/db_functions/db_functions.dart';
import 'package:strongify/db_model/model.dart';
import 'package:strongify/screens/login/whats_your_goal.dart';
import 'package:flutter/material.dart';

void storeUserData(
  context,
  selectvalue,
  String txtDate,
  String weight,
  String height,
) async {
  if (selectvalue != null &&
      txtDate.isNotEmpty &&
      weight.isNotEmpty &&
      height.isNotEmpty) {
    final userDetails = UserDetails(
      gender: selectvalue!,
      age: int.parse(txtDate),
      weight: int.parse(weight),
      height: int.parse(height),
    );

    await adduserdetails(userDetails);

//retriving data for test purpose
    final userDetailsBox = await Hive.openBox<UserDetails>('user_details');
    final List<UserDetails> users = userDetailsBox.values.toList();

    if (users.isNotEmpty) {
    } else {}

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WhatsYourGoal()),
    );
  } else {
    // Handle invalid input or show an error message
    showSnackBar(context, 'Fill all the fields before proceding', Colors.red);
  }
}

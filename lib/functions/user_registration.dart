import 'package:flutter/material.dart';
import 'package:strongify/common_widget/show_warning.dart';
import 'package:strongify/functions/shared_pref.dart';
import 'package:strongify/screens/login/complete_profile_screen.dart';

userRegistration(showError, passwordError, nameError, firstname, lastname,
    email, password, isCheck, context) {
  if (!showError && !passwordError && !nameError) {
    storeSignUpDetails(firstname, lastname, email, password);
    if (!isCheck) {
      showWarningDialog(context, 'ACCEPT TERMS OF USE',
          'Please acccept terms of use before proceeding!', () {
        Navigator.of(context).pop();
      });
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const CompleteProfileSCreen(),
        ),
      );
    }
  }
}

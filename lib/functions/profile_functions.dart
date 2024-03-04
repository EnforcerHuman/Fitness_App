import 'package:flutter/material.dart';
import 'package:strongify/screens/profile/privacy_policy_screen.dart';

void handleItemClick(context, Map<String, String> item) {
  if (item["name"] == "Contact Us") {
    // Navigate to ContactUsPage
    print('contact us');
  } else if (item["name"] == "Setting") {
    // Navigate to SettingsView
    print('settings');
  } else if (item["name"] == "Privacy Policy") {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => PrivacyPolicyPage()));
    print('privacy policy');
  } else if (item["name"] == "Personal Data") {
    print('Personal Data');
  } else if (item["name"] == "Achievement") {
    print('Achievement');
  } else if (item["name"] == "Activity History") {
    print('Activity History');
  } else if (item["name"] == "Workout Progress") {
    print('Workout Progress');
  }
}

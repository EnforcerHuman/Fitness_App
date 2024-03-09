import 'package:flutter/material.dart';
import 'package:strongify/screens/profile/feedback_screen.dart';
import 'package:strongify/screens/profile/privacy_policy_screen.dart';
import 'package:strongify/screens/workout_tracker/workout_tracker_screen.dart';

void handleItemClick(context, Map<String, String> item) {
  if (item["name"] == "Contact Us") {
    // Navigate to ContactUsPage
  } else if (item["name"] == "Setting") {
    // Navigate to SettingsView
  } else if (item["name"] == "Privacy Policy") {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => PrivacyPolicyPage()));
  } else if (item["name"] == "Personal Data") {
    //personal data
  } else if (item["name"] == "feedback") {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => ReviewForm()));
  } else if (item["name"] == "Activity History") {
  } else if (item["name"] == "Workout Progress") {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => const WorkoutTrackerScreen()));
  }
}

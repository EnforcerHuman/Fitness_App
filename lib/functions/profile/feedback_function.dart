import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final TextEditingController reviewController = TextEditingController();
void submitReview() async {
  String review = reviewController.text;

  Uri emailUrl =
      Uri.parse('mailto:melbinbabu066@gmail.com?subject=Feedback&body=$review');

  if (await canLaunchUrl(emailUrl)) {
    await launchUrl(emailUrl);
  } else {
    throw 'Could not launch $emailUrl';
  }
}

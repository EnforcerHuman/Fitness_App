import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  final String privacyPolicyData = '''
  STRONGIFY

    Effective Date: [01-0-24]

    Introduction:
    Welcome to Your STRONGIFY! This Privacy Policy is meant to help you understand how we collect, use, and safeguard your personal information.

    Information We Collect:
    - Personal Information: We may collect information such as your name, email address, and other personal details when you sign up or use our app.
    - Fitness Data: The app may collect data related to your fitness activities, such as workout history, steps taken, and other relevant information.

 How We Use Your Information:
    - Personalization: We use your information to personalize your experience within the app.
    - Analytics: We may use your data for analytics purposes to improve our app and services.
    - Communication: We may send you updates, newsletters, or important announcements related to the app.

    Data Security:
    We take appropriate measures to protect your information. Your data is stored securely and access is restricted to authorized personnel only.

    Third-Party Services:
    Your Fitness App may integrate with third-party services for features like social sharing or analytics. Please review the privacy policies of these third-party services.

    Changes to Privacy Policy:
    We may update this Privacy Policy from time to time. You will be notified of any significant changes.

    Contact Us:
    If you have any questions or concerns about our Privacy Policy, please contact us at [contact@email.com].
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            privacyPolicyData,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PrivacyPolicyPage(),
  ));
}

import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: media.width * 0.2,
            ),
            child: Container(
              width: media.width * 0.9,
              height: media.width * 0.5,
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text(
                        'Contact us',
                        style: TextStyle(fontSize: Checkbox.width),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('email : melbinbabu66@gmail.com'),
                    ],
                  ),
                  Text(
                    'note: If you have any questions or concerns about our Privacy Policy, please contact us at above email',
                    style: TextStyle(fontSize: media.width * 0.03),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

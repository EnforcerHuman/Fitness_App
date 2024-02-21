import 'dart:async';

import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int timerDuration = 10; // Set the timer duration in seconds
  late int remainingTime;
  String test = '';
  String checkcompletion = 'work hard';

  @override
  void initState() {
    super.initState();
    remainingTime = timerDuration;

    // Start the timer
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        remainingTime = timerDuration - timer.tick;

        // Check if the timer has reached the end
        if (timer.tick >= timerDuration) {
          timer.cancel();
          setState(() {
            checkcompletion = 'completed';
          });
          test = 'completed';
          print('completed'); // Stop the timer when it reaches the duration
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var list = ['Full body', 'Upper body', 'AB workout'];
    String selectedOption = 'Full body';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: Tcolor.secondryGradient)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 1, end: 0),
                      duration: Duration(seconds: timerDuration),
                      builder: (BuildContext context, double value, _) {
                        return CircularProgressIndicator(
                          value: remainingTime / timerDuration * value,
                          color: Colors.white,
                          backgroundColor: Color.fromARGB(255, 110, 236, 114),
                        );
                      },
                    ),
                  ),
                  Text(
                    '$remainingTime s',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: Text(checkcompletion))
            ],
          ),
        ),
      ),
    );
  }
}

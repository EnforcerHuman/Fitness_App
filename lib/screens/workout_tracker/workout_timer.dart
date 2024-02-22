import 'dart:async';

import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';

class WorkoutTimerScreen extends StatefulWidget {
  final double duration;
  const WorkoutTimerScreen({super.key, required this.duration});

  @override
  State<WorkoutTimerScreen> createState() => _WorkoutTimerScreenState();
}

class _WorkoutTimerScreenState extends State<WorkoutTimerScreen> {
  late double timerDuration; // Set the timer duration in seconds
  late double remainingTime;
  String test = '';
  String checkcompletion = 'work hard';
  late int seconds;
  late int minutes;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.duration;
    minutes = remainingTime.floor();
    seconds = ((remainingTime - minutes) * 100).round();
    timerDuration = widget.duration;
    Timer.periodic(const Duration(seconds: 1, minutes: 1), (timer) {
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
    // var list = ['Full body', 'Upper body', 'AB workout'];
    // String selectedOption = 'Full body';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: Tcolor.secondryGradient)),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/img/On_2.png',
                  fit: BoxFit.contain,
                ),
              ),
              Column(
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
                          duration:
                              Duration(minutes: minutes, seconds: seconds),
                          builder: (BuildContext context, double value, _) {
                            return CircularProgressIndicator(
                              value: remainingTime / timerDuration * value,
                              color: Colors.white,
                              backgroundColor:
                                  const Color.fromARGB(255, 110, 236, 114),
                            );
                          },
                        ),
                      ),
                      Text(
                        '$remainingTime minutes',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print(widget.duration);
                      },
                      child: Text(checkcompletion))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/common_widget/round_button.dart';
import 'package:strongify/screens/workout_tracker/finished_workout_screen.dart';

import 'package:timer_builder/timer_builder.dart';

class TimerApp extends StatefulWidget {
  final int miunutes;
  final int seconds;
  final String workout;
  const TimerApp(
      {Key? key,
      required this.miunutes,
      required this.seconds,
      required this.workout})
      : super(key: key);

  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  int seconds = 0;
  bool isRunning = false;
  int setMinutes = 0;
  bool isPaused = false;
  int setSeconds = 0;

  @override
  void initState() {
    super.initState();
    setMinutes = widget.miunutes;
    setSeconds = widget.seconds;
    startTimer();
  }

  void startTimer() {
    setState(() {
      isRunning = true;
    });
  }

  void stopTimer() {
    setState(() {
      isRunning = false;
      seconds = 0;
    });
  }

  void pauseTimer() {
    setState(() {
      isRunning = false;
      isPaused = true;
    });
  }

  String formatTime(int timeInSeconds) {
    int minutes = timeInSeconds ~/ 60;
    int seconds = timeInSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: Tcolor.secondryGradient)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: Image.asset('assets/img/Strongify logo.png'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.3,
              ),
              Text(widget.workout),
              TimerBuilder.periodic(const Duration(seconds: 1),
                  builder: (context) {
                if (isRunning && seconds < setSeconds + setMinutes * 60) {
                  seconds++;
                }
                int remainingTime = (setSeconds + setMinutes * 60) - seconds;
                if (remainingTime <= 0) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => FinishedWorkoutView()));
                }
                return Column(
                  children: [
                    SizedBox(
                      width: 250,
                      height: 250,
                      child: CircularProgressIndicator(
                        value: seconds / (setMinutes * 60 + setSeconds),
                        strokeWidth: 10,
                        color: Colors.black12,
                        backgroundColor:
                            const Color.fromARGB(255, 245, 231, 190),
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Remaining Workout Time: ${formatTime(remainingTime)}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                );
              }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundButton(
                  title: isRunning ? 'Pause workout' : 'Resume workout',
                  onPressed: isRunning
                      ? pauseTimer
                      : (isPaused ? startTimer : stopTimer),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

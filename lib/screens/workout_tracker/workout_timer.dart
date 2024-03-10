import 'package:flutter/material.dart';

import 'package:strongify/common/color_extension.dart';
import 'package:strongify/common_widget/round_button.dart';
import 'package:strongify/screens/workout_tracker/finished_workout_screen.dart';
import 'package:timer_builder/timer_builder.dart';

class WorkoutTimerScreen extends StatefulWidget {
  final int miunutes;
  final int seconds;
  final String workout;
  final String value;
  const WorkoutTimerScreen(
      {super.key,
      required this.miunutes,
      required this.seconds,
      required this.workout,
      required this.value});

  @override
  // ignore: library_private_types_in_public_api
  _WorkoutTimerScreenState createState() => _WorkoutTimerScreenState();
}

class _WorkoutTimerScreenState extends State<WorkoutTimerScreen> {
  int seconds = 0;
  bool isRunning = false;
  int setMinutes = 0;
  bool isPaused = false;
  int setSeconds = 0;
  double progressvalue = 0;
  @override
  void initState() {
    super.initState();
    setMinutes = widget.miunutes;
    setSeconds = widget.seconds;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: Tcolor.secondryGradient),
        ),
        child: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  '${widget.workout} | ${widget.value}',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              TimerBuilder.periodic(const Duration(seconds: 1),
                  builder: (context) {
                if (isRunning && seconds < setSeconds + setMinutes * 60) {
                  seconds++;
                }
                int remainingTime = (setSeconds + setMinutes * 60) - seconds;
                if (remainingTime <= 0) {
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (ctx) => const FinishedWorkoutView()));
                  });
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
              SizedBox(
                height: media.width * 0.3,
              ),
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
}

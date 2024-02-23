import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

class TimerApp extends StatefulWidget {
  final int miunutes;
  final int seconds;

  const TimerApp({
    Key? key,
    required this.miunutes,
    required this.seconds,
  }) : super(key: key);

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerBuilder.periodic(const Duration(seconds: 1),
                builder: (context) {
              if (isRunning && seconds < setSeconds + setMinutes * 60) {
                seconds++;
              }
              int remainingTime = (setSeconds + setMinutes * 60) - seconds;
              return Column(
                children: [
                  CircularProgressIndicator(
                    value: isRunning
                        ? seconds / (setMinutes * 60 + setSeconds)
                        : 0.0,
                    strokeWidth: 10,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Time: $seconds seconds',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Remaining Time: ${formatTime(remainingTime)}',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              );
            }),
            ElevatedButton(
              onPressed: isRunning ? stopTimer : startTimer,
              child: Text(isRunning ? 'Stop Timer' : 'Start Timer'),
            ),
            ElevatedButton(
              onPressed:
                  isRunning ? pauseTimer : (isPaused ? startTimer : stopTimer),
              child: Text(isRunning
                  ? 'Pause Timer'
                  : (isPaused ? 'Resume Timer' : 'Start Timer')),
            ),
          ],
        ),
      ),
    );
  }
}

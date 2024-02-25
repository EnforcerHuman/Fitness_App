import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/db/db_functions.dart';
import 'package:strongify/db_model/model.dart';
import 'package:strongify/functions/workout_functions/progress_functions.dart';

import '../../common_widget/round_button.dart';

class FinishedWorkoutView extends StatefulWidget {
  const FinishedWorkoutView({super.key});

  @override
  State<FinishedWorkoutView> createState() => _FinishedWorkoutViewState();
}

class _FinishedWorkoutViewState extends State<FinishedWorkoutView> {
  double progressvalue = 2;

  @override
  void initState() {
    super.initState();
    setprogressvalue();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/img/complete_workout.png",
                height: media.width * 0.8,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Congratulations, You Have Finished Your Workout",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Tcolor.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Exercises is king and nutrition is queen. Combine the two and you will have a kingdom",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Tcolor.gray,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "-Jack Lalanne",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Tcolor.gray,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              RoundButton(
                  title: "Next Workout",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // String formatTime(int timeInSeconds) {
  //   int minutes = timeInSeconds ~/ 60;
  //   int seconds = timeInSeconds % 60;
  //   return '$minutes:${seconds.toString().padLeft(2, '0')}';
  // }

  // Future<void> setprogressvalue() async {
  //   String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  //   double existingprogressvalue =
  //       await retrieveProgressForSpecificDay('2024-02-29');
  //   print('existingprogressvalue $existingprogressvalue');

  //   progressvalue = existingprogressvalue + 3.33;
  //   print('added progress value $progressvalue');

  //   final progress = WorkoutProgres(progressvalue, '2024-02-29');
  //   await addprogress(progress);
  //   retriveprogress();
  // }
}

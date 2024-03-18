import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/functions/workout_functions/finished_workout.dart';
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
    setvalue();
  }

  Future<void> setvalue() async {
    await setprogressvalue();
    setvalues();
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
              Expanded(
                child: Image.asset(
                  "assets/img/complete_workout.png",
                  height: media.width * 0.8,
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Congratulations, You Have Finished Your Workout",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Exercises are king and nutrition is queen. Combine the two and you will have a kingdom",
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
                    ],
                  ),
                ),
              ),
              const Spacer(),
              RoundButton(
                title: "Next Workout",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

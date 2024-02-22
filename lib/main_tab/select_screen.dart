import 'package:flutter/material.dart';
import 'package:strongify/common_widget/round_button.dart';
import 'package:strongify/screens/sleep_tracker/sleep_tracker_screen.dart';
import 'package:strongify/screens/workout_tracker/workout_tracker_screen.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(
                title: "Workout Tracker",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WorkoutTrackerScreen(),
                    ),
                  );
                }),
            const SizedBox(
              height: 15,
            ),
            RoundButton(
                title: "Meal Planner",
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const MealPlannerView(),
                  //   ),
                  // );
                }),
            const SizedBox(
              height: 15,
            ),
            RoundButton(
                title: "Sleep Tracker",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SleepTrackerScreen(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

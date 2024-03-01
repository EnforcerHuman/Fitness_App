import 'package:flutter/material.dart';
import 'package:strongify/common_widget/round_button.dart';
import 'package:strongify/db/db_functions.dart';
import 'package:strongify/db_model/model.dart';
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
            const SizedBox(
              height: 15,
            ),
            RoundButton(
                title: "Test progress",
                onPressed: () async {
                  // final test = WorkoutProgres(23, '2024-03-10');
                  // addprogress(test);
                  // // printAllProgress();
                  // // printProgressForDate('2024-3-11');
                  // retrieveLast7DaysProgress('2024-03-18');
                  DateTime date = DateTime.now();
                  final test2 = SleepProgres('2024-03-11', date, date);
                  addsleepschedule(test2);
                  // retriveSleepSchedule();
                })
          ],
        ),
      ),
    );
  }
}

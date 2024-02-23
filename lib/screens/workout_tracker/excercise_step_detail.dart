import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/screens/workout_tracker/workout_timer.dart';
import 'package:strongify/test.dart';
import 'package:strongify/utilities/excercise_steps.dart';

import '../../common_widget/round_button.dart';
import '../../common_widget/step_detail_row.dart';

class ExercisesStepDetails extends StatefulWidget {
  final Map eObj;
  const ExercisesStepDetails({super.key, required this.eObj});

  @override
  State<ExercisesStepDetails> createState() => _ExercisesStepDetailsState();
}

class _ExercisesStepDetailsState extends State<ExercisesStepDetails> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Tcolor.lightGray,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/img/closed_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Tcolor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/img/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Tcolor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                        gradient:
                            LinearGradient(colors: Tcolor.primaryGradient),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      widget.eObj['title'] == "Warm Up"
                          ? 'assets/img/warm up animation.gif'
                          : widget.eObj['title'] == "Jumping Jack"
                              ? stepArr[0]['animation'].toString()
                              : widget.eObj['title'] == 'Skipping'
                                  ? 'assets/img/skipping animation.gif'
                                  : widget.eObj['title'] == "Squats"
                                      ? 'assets/img/squats animation.gif'
                                      : 'assets/img/Burpees animation.gif',
                      width: media.width,
                      height: media.width * 0.43,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                        color: Tcolor.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.eObj["title"].toString(),
                style: TextStyle(
                    color: Tcolor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "${widget.eObj['value']} | ${widget.eObj['calories']} calories",
                style: TextStyle(
                  color: Tcolor.gray,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Descriptions",
                style: TextStyle(
                    color: Tcolor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              ReadMoreText(
                widget.eObj['description'],
                trimLines: 4,
                colorClickableText: Tcolor.black,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Read More ...',
                trimExpandedText: ' Read Less',
                style: TextStyle(
                  color: Tcolor.gray,
                  fontSize: 12,
                ),
                moreStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How To Do It",
                    style: TextStyle(
                        color: Tcolor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "${stepArr.length} Sets",
                      style: TextStyle(color: Tcolor.gray, fontSize: 12),
                    ),
                  )
                ],
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: stepArr.length,
                itemBuilder: ((context, index) {
                  //full body workout
                  var armObj = stepArr[index] as Map? ?? {};
                  var wrmObj = warmUpArr[index] as Map? ?? {};
                  var skpObj = skippingStepArr[index] as Map? ?? {};
                  var sqtsObj = squatStepArr[index] as Map? ?? {};
                  var rstObj = restAndHydrationArr[index] as Map? ?? {};
                  var brpsObj = burpeesStepArr[index] as Map? ?? {};
                  var plnkObj = plankToTuckJumpStepArr[index] as Map? ?? {};
                  var twstObj = russianTwistsStepArr[index] as Map? ?? {};
                  var dmblObj = dumbbellRowsStepArr[index] as Map? ?? {};
                  var clmbrsObj = burpeesStepArr[index] as Map? ?? {};
//lower body
                  var bdyObj = bodyweightSquatsArr[index] as Map? ?? {};
                  var lngsObj = forwardLungesArr[index] as Map? ?? {};
                  var dlftsObj = romanianDeadliftsArr[index] as Map? ?? {};
                  var clfObj = calfRaisesArr[index] as Map? ?? {};
                  var brdgsObj = gluteBridgesArr[index] as Map? ?? {};
                  var stpObj = stepUpArr[index] as Map? ?? {};
                  var wlstObj = wallSitArr[index] as Map? ?? {};
                  var lgrsObj = lateralLegRaisesStepArr[index] as Map? ?? {};

//AB workout
                  var crnchObj = crunchesArr[index] as Map? ?? {};
                  var bcrchObj = bicycleCrunchesArr[index];
                  var plankObj = plankArr[index];
                  var lgrs2Obj = legRaisesArr[index];
                  var clmbObj = mountainClimbersArr[index];
                  var rtwstObj = russianTwistsArr[index];
                  var lgtwstObj = lyingLegTwistsArr[index];
                  var plnkjkObj = plankJacksArr[index];

                  return StepDetailRow(
                    sObj: widget.eObj['title'] == 'Warm Up'
                        ? wrmObj
                        : widget.eObj['title'] == 'Skipping'
                            ? skpObj
                            : widget.eObj['title'] == 'Squats'
                                ? sqtsObj
                                : widget.eObj['title'] == 'Arm Raises'
                                    ? armObj
                                    : widget.eObj['title'] == 'Rest and Drink'
                                        ? rstObj
                                        : widget.eObj['title'] == 'Burpees'
                                            ? brpsObj
                                            : widget.eObj['title'] ==
                                                    'Plank to Tuck Jump'
                                                ? plnkObj
                                                : widget.eObj['title'] ==
                                                        'Russian Twists'
                                                    ? twstObj
                                                    : widget.eObj['title'] ==
                                                            'Dumbbell Rows'
                                                        ? dmblObj
                                                        : widget.eObj[
                                                                    'title'] ==
                                                                'Mountain Climbers'
                                                            ? clmbrsObj
                                                            : widget.eObj[
                                                                        'title'] ==
                                                                    'Mountain Climbers'
                                                                ? clmbrsObj
                                                                : widget.eObj[
                                                                            'title'] ==
                                                                        'Warm Up'
                                                                    ? wrmObj

                                                                    //lowerbody starts here
                                                                    : widget.eObj['title'] ==
                                                                            'Bodyweight Squats'
                                                                        ? bdyObj
                                                                        : widget.eObj['title'] ==
                                                                                'Forward Lunges'
                                                                            ? lngsObj
                                                                            : widget.eObj['title'] == 'Romanian Deadlifts'
                                                                                ? dlftsObj
                                                                                : widget.eObj['title'] == 'Calf Raises'
                                                                                    ? clfObj
                                                                                    : widget.eObj['title'] == 'Glute Bridges'
                                                                                        ? brdgsObj
                                                                                        : widget.eObj['title'] == 'Step-Ups'
                                                                                            ? stpObj
                                                                                            : widget.eObj['title'] == 'Wall Sit'
                                                                                                ? wlstObj
                                                                                                : widget.eObj['title'] == 'Lateral Leg Raises'
                                                                                                    ? lgrsObj
                                                                                                    //AB work out starts here
                                                                                                    : widget.eObj['title'] == 'Bicycle Crunches'
                                                                                                        ? bicycleCrunchesArr[index]
                                                                                                        : widget.eObj['title'] == 'Crunches'
                                                                                                            ? crnchObj
                                                                                                            : widget.eObj['title'] == 'Plank'
                                                                                                                ? plankObj
                                                                                                                : widget.eObj['title'] == 'Leg Raises'
                                                                                                                    ? lgrs2Obj
                                                                                                                    : widget.eObj['title'] == 'Mountain Climbers'
                                                                                                                        ? clmbObj
                                                                                                                        : widget.eObj['title'] == 'Russian Twists'
                                                                                                                            ? rtwstObj
                                                                                                                            : widget.eObj['title'] == 'Lying Leg Twists'
                                                                                                                                ? lgtwstObj
                                                                                                                                : widget.eObj['title'] == 'Plank Jacks'
                                                                                                                                    ? plnkjkObj
                                                                                                                                    : rstObj,
                    isLast: stepArr.last == armObj,
                  );
                }),
              ),
              //
              RoundButton(
                  title: "Start",
                  elevation: 0,
                  onPressed: () {
                    double time = widget.eObj[
                        'time']; // Assuming 2.30 represents 2 minutes and 30 seconds

                    int minutes =
                        time.toInt(); // Extracting the integer part as minutes
                    int seconds = ((time - minutes) * 100)
                        .round(); // Extracting the decimal part as seconds

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => TimerApp(
                              miunutes: minutes,
                              seconds: seconds,
                            )));
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (ctx) => WorkoutTimerScreen(
                    //           duration: widget.eObj['time'],
                    //         )));
                  }),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/common_widget/Excersises_set_section.dart';
import 'package:strongify/common_widget/icon_title_nex_row.dart';
import 'package:strongify/common_widget/round_button.dart';
import 'package:strongify/screens/workout_tracker/excercise_step_detail.dart';

class WorkoutDetailScreen extends StatefulWidget {
  final Map dObj;
  const WorkoutDetailScreen({super.key, required this.dObj});

  @override
  State<WorkoutDetailScreen> createState() => _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  // List latestArr = [
  //   {"image": "", "title": "Fullbody Workout", "time": "Today, 03:00pm"},
  //   {
  //     "image": "assets/img/Workout2.png",
  //     "title": "Upperbody Workout",
  //     "time": "June 05, 02:00pm"
  //   },
  // ];

  List youArr = [
    {"image": "assets/img/barbell.png", "title": "Barbell"},
    {"image": "assets/img/skipping_rope.png", "title": "Skipping Rope"},
    {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
  ];

  //
//full body excersidses array
  List exercisesArr = [
    {
      "name": "Set 1",
      "set": [
        {
          "image": "assets/img/warm up.webp",
          "title": "Warm Up",
          "value": "05:00",
          "description": "Gentle exercises to warm up your body.",
          "animation": "assets/img/jumping jack animation.gif"
        },
        {
          "image": "assets/img/jumping jack.jpg",
          "title": "Jumping Jack",
          "value": "12x",
          "description":
              "A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide.",
          "animation": "assets/img/jumping jack animation.gif"
        },
        {
          "image": "assets/img/skipping.jpg",
          "title": "Skipping",
          "value": "15x",
          "description": "Skipping with a jump rope.",
          "animation": "assets/img/jumping jack animation.gif"
        },
        {
          "image": "assets/img/squats.jpg",
          "title": "Squats",
          "value": "20x",
          "description": "Perform squats to target your leg muscles.",
          "animation": "assets/img/jumping jack animation.gif"
        },
        {
          "image": "assets/img/Arm rises.jpg",
          "title": "Arm Raises",
          "value": "00:53",
          "description": "Raise your arms to engage shoulder muscles.",
          "animation": "assets/img/jumping jack animation.gif"
        },
        {
          "image": "assets/img/rest and drink.jpg",
          "title": "Rest and Drink",
          "value": "02:00",
          "description": "Take a break and stay hydrated.",
          "animation": "assets/img/jumping jack animation.gif"
        },
      ],
    },
    {
      "name": "Set 2",
      "set": [
        {
          "image": "assets/img/rest and drink.jpg",
          "title": "Burpees",
          "value": "05:00",
          "description":
              ": Start in a standing position, then squat down and kick your feet back into a plank position. Perform a push-up, jump your feet back to your hands, and explosively jump up",
          "animation": "assets/img/jumping jack animation.gif"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Plank to Tuck Jump",
          "value": "12x",
          "description":
              "Begin in a plank position, then jump your feet toward your hands, tucking your knees to your chest. Return to plank position and repeat.",
          "animation": "assets/img/jumping jack animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Russian Twists",
          "value": "15x",
          "description":
              " Sit on the floor with your knees bent and lean back slightly. Hold your hands together and twist your torso to one side, then the other, targeting your obliques.",
          "animation": "assets/img/jumping jack animation.gif"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Dumbbell Rows",
          "value": "20x",
          "description":
              ": Hold a dumbbell in each hand, hinge at the hips, and pull the weights toward your chest, engaging your back muscles",
          "animation": "assets/img/jumping jack animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Mountain Climbers",
          "value": "00:53",
          "description":
              "Start in a plank position and bring one knee toward your chest, then switch legs in a running motion. Keep your core engaged.",
          "animation": "assets/img/jumping jack animation.gif"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Rest and Drink",
          "value": "02:00",
          "description": "Take a break and stay hydrated.",
          "animation": "assets/img/jumping jack animation.gif"
        },
      ],
    },
  ];
//
//lowerbody excersise array
  List lowerBodyWorkoutArr = [
    {
      "name": "Set 1",
      "set": [
        {
          "image": "assets/img/img_1.png",
          "title": "Bodyweight Squats",
          "value": "15x",
          "description":
              "Stand with feet shoulder-width apart. Lower your body by bending your knees and hips, then return to the starting position.",
          "animation": "assets/img/squat_animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Forward Lunges",
          "value": "12x per leg",
          "description":
              "Take a step forward with one leg, lower your body until both knees are bent at a 90-degree angle. Return to the starting position and switch legs.",
          "animation": "assets/img/lunge_animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Romanian Deadlifts",
          "value": "15x",
          "description":
              "Hold a barbell or dumbbells in front of your thighs. Hinge at your hips, keeping your back straight, and lower the weights towards the ground, then return to the starting position.",
          "animation": "assets/img/deadlift_animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Calf Raises",
          "value": "20x",
          "description":
              "Stand on a flat surface and lift your heels as high as possible by pushing through the balls of your feet. Lower back down and repeat.",
          "animation": "assets/img/calf_raise_animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Rest and Drink",
          "value": "02:00",
          "description": "Take a break and prepare for the next set."
        },
      ],
    },
    {
      "name": "Set 2",
      "set": [
        {
          "image": "assets/img/img_1.png",
          "title": "Glute Bridges",
          "value": "15x",
          "description":
              "Lie on your back with knees bent, lift your hips towards the ceiling, squeezing your glutes at the top. Lower back down and repeat.",
          "animation": "assets/img/glute_bridge_animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Step-Ups",
          "value": "12x per leg",
          "description":
              "Step onto a sturdy platform with one foot, driving through the heel to lift your body up. Step back down and repeat on the other leg.",
          "animation": "assets/img/step_ups_animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Wall Sit",
          "value": "1:00",
          "description":
              "Sit against a wall with your knees bent at a 90-degree angle. Hold the position, engaging your quadriceps and glutes.",
          "animation": "assets/img/wall_sit_animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Lateral Leg Raises",
          "value": "15x per leg",
          "description":
              "Lie on your side and lift your top leg towards the ceiling, engaging your outer thigh. Lower back down and repeat on the other side.",
          "animation": "assets/img/lateral_leg_raise_animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Rest and Drink",
          "value": "02:00",
          "description": "Take a break and stay hydrated."
        },
      ],
    },
  ];
//
//AB workout array
  List abWorkoutArr = [
    {
      "name": "Set 1",
      "set": [
        {
          "image": "assets/img/img_1.png",
          "title": "Crunches",
          "value": "20x",
          "description":
              "Lie on your back with knees bent, hands behind your head. Lift your upper body towards your knees, engaging your abdominal muscles.",
          "animation": "assets/img/crunch_animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Bicycle Crunches",
          "value": "15x per side",
          "description":
              "Lie on your back, lift your legs, and bring one knee towards your chest while twisting your torso to touch the opposite elbow. Repeat on the other side.",
          "animation": "assets/img/bicycle_crunch_animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Plank",
          "value": "1:00",
          "description":
              "Start in a plank position, keeping your body in a straight line from head to heels. Engage your core and hold the position.",
          "animation": "assets/img/plank_animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Leg Raises",
          "value": "15x",
          "description":
              "Lie on your back with legs straight. Lift your legs towards the ceiling, engaging your lower abs, then lower them back down without letting them touch the ground.",
          "animation": "assets/img/leg_raise_animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Rest and Drink",
          "value": "02:00",
          "description": "Take a break and prepare for the next set."
        },
      ],
    },
    {
      "name": "Set 2",
      "set": [
        {
          "image": "assets/img/img_1.png",
          "title": "Mountain Climbers",
          "value": "30s",
          "description":
              "Start in a plank position and bring one knee towards your chest, then switch legs in a running motion. Keep your core engaged.",
          "animation": "assets/img/mountain_climber_animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Russian Twists",
          "value": "20x",
          "description":
              "Sit on the floor, lean back slightly, and twist your torso to one side, then the other, holding a weight or medicine ball for added resistance.",
          "animation": "assets/img/russian_twists_animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Lying Leg Twists",
          "value": "15x per side",
          "description":
              "Lie on your back with legs lifted. Lower your legs to one side, engaging your obliques, then return to the center and repeat on the other side.",
          "animation": "assets/img/lying_leg_twist_animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Plank Jacks",
          "value": "20x",
          "description":
              "Start in a plank position and jump your legs wide, then back together. Keep your core tight and maintain a steady pace.",
          "animation": "assets/img/plank_jacks_animation.gif"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Rest and Drink",
          "value": "02:00",
          "description": "Take a break and stay hydrated."
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: Tcolor.primaryGradient)),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
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
                    "assets/img/black_btn.png",
                    width: 15,
                    height: 15,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    print('tappped');
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
                      "assets/img/more_btn.png",
                      width: 15,
                      height: 15,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leadingWidth: 0,
              leading: Container(),
              expandedHeight: media.width * 0.5,
              flexibleSpace: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/img/detail_top.png",
                  width: media.width * 0.75,
                  height: media.width * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Tcolor.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 50,
                        height: 4,
                        decoration: BoxDecoration(
                            color: Tcolor.gray.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.dObj["title"].toString(),
                                  style: TextStyle(
                                      color: Tcolor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "${widget.dObj["exercises"].toString()} | ${widget.dObj["time"].toString()} | 320 Calories Burn",
                                  style: TextStyle(
                                      color: Tcolor.gray, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Image.asset(
                              "assets/img/fav.png",
                              width: 15,
                              height: 15,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      IconTitleNextRow(
                          icon: "assets/img/time.png",
                          title: "Schedule Workout",
                          time: "5/27, 09:00 AM",
                          color: Tcolor.primaryColor2.withOpacity(0.3),
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkoutScheduleView() )  );
                          }),
                      SizedBox(
                        height: media.width * 0.02,
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "You'll Need",
                            style: TextStyle(
                                color: Tcolor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "${youArr.length} Items",
                              style:
                                  TextStyle(color: Tcolor.gray, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.5,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: youArr.length,
                            itemBuilder: (context, index) {
                              var yObj = youArr[index] as Map? ?? {};
                              return Container(
                                  margin: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: media.width * 0.35,
                                        width: media.width * 0.35,
                                        decoration: BoxDecoration(
                                            color: Tcolor.lightGray,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          yObj["image"].toString(),
                                          width: media.width * 0.2,
                                          height: media.width * 0.2,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          yObj["title"].toString(),
                                          style: TextStyle(
                                              color: Tcolor.black,
                                              fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ));
                            }),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Exercises",
                            style: TextStyle(
                                color: Tcolor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "2 Sets",
                              style:
                                  TextStyle(color: Tcolor.gray, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: exercisesArr.length,
                          itemBuilder: (context, index) {
                            var aObj = exercisesArr[index] as Map? ?? {};
                            var bObj = lowerBodyWorkoutArr[index] as Map? ?? {};
                            var cObj = abWorkoutArr[index] as Map? ?? {};

                            return ExercisesSetSection(
                              sObj: widget.dObj["title"] == 'Fullbody Workout'
                                  ? aObj
                                  : widget.dObj["title"] == 'Lowebody Workout'
                                      ? bObj
                                      : widget.dObj["title"] == 'AB Workout'
                                          ? cObj
                                          : cObj,
                              onPressed: (obj) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ExercisesStepDetails(
                                      eObj: obj,
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RoundButton(title: "Start Workout", onPressed: () {})
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

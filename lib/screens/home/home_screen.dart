import 'dart:async';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/common_widget/round_button.dart';
import 'package:strongify/functions/Home/step_counting_functions.dart';
import 'package:strongify/functions/Home/water_steps_function.dart';
import 'package:strongify/functions/calarie_calculator.dart';
import 'package:strongify/functions/calculate_bmi.dart';
import 'package:strongify/functions/profile/userdetails.dart';
import 'package:strongify/functions/sleep_tracker_functions/sleep_schedule.dart';
import 'package:strongify/screens/home/bmi_details_screen.dart';
import 'package:strongify/screens/profile/activity_tracker_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences prefs;
  bool gender = false;
  double waterratio = 0;

  @override
  void initState() {
    super.initState();
    requestPermissions();
    initPlatformState();
    test();
    loaduserDetails();
    gettargets();
    initializeData();
  }

  Future<void> initializeData() async {
    await gettargets();
    initializeWaterArr();
    setState(() {});
  }

  @override
  void dispose() {
    pedestrianStatusStream.drain();
    stepCountStream.drain();
    super.dispose();
  }

  Future<void> test() async {
    await getsleephours(DateTime.now().subtract(const Duration(days: 1)));
  }

  @override
  Widget build(BuildContext context) {
    double calories = estimateCaloriesBurned(steps.value);
    var media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Tcolor.white,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "welcome Back,",
                          style: TextStyle(color: Tcolor.gray, fontSize: 12),
                        ),
                        ValueListenableBuilder(
                            valueListenable: username,
                            builder: (context, value, child) {
                              return Text(
                                username.value,
                                style: TextStyle(
                                    color: Tcolor.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              );
                            }),
                        SizedBox(
                          height: media.width * 0.05,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Container(
                  height: media.width * 0.4,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: Tcolor.secondryGradient),
                      borderRadius: BorderRadius.circular(media.width * 0.075)),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/img/bg_dots.png',
                        height: media.width * 0.4,
                        width: double.maxFinite,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "BMI (Body Mass Index)",
                                  style: TextStyle(
                                      color: Tcolor.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: media.width * 0.04,
                                ),
                                SizedBox(
                                  height: 35,
                                  width: 120,
                                  child: RoundButton(
                                      fontWeight: FontWeight.w400,
                                      title: 'View More',
                                      type: RoundButtonType.bgGradient,
                                      fontSize: 12,
                                      onPressed: () async {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    const BmiDetailsScreen()));
                                      }),
                                )
                              ],
                            ),
                            AspectRatio(
                              aspectRatio: 1,
                              child: FutureBuilder<List<PieChartSectionData>>(
                                future: showingSections(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    List<PieChartSectionData> sections =
                                        snapshot.data!;
                                    return PieChart(
                                      PieChartData(
                                        pieTouchData: PieTouchData(
                                          touchCallback: (FlTouchEvent event,
                                              pieTouchResponse) {},
                                        ),
                                        startDegreeOffset: 250,
                                        borderData: FlBorderData(
                                          show: false,
                                        ),
                                        sectionsSpace: 1,
                                        centerSpaceRadius: 0,
                                        sections: sections,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Tcolor.secondryColor2.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today Target",
                        style: TextStyle(
                            color: Tcolor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 70,
                        height: 25,
                        child: RoundButton(
                          title: "Check",
                          type: RoundButtonType.bgGradient,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ActivityTrackerScreen(),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  "Activity Status",
                  style: TextStyle(
                      color: Tcolor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.02,
                ),
                Container(
                  height: media.width * 0.4,
                  decoration: BoxDecoration(
                      color: Tcolor.secondryColor2.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(media.width * 0.075)),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Totalsteps',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                                ValueListenableBuilder<int>(
                                    valueListenable: steps,
                                    builder: (context, value, child) {
                                      return Text(
                                        steps.value.toString(),
                                        style: TextStyle(
                                          foreground: Paint()
                                            ..shader = LinearGradient(
                                              colors: Tcolor.secondryGradient,
                                            ).createShader(const Rect.fromLTWH(
                                                0.0, 0.0, 200.0, 70.0)),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      );
                                    }),
                                const Text(
                                  'Target',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                                ValueListenableBuilder(
                                    valueListenable: steptarget,
                                    builder: (context, value, child) {
                                      return Text(
                                        steptarget.value,
                                        style: TextStyle(
                                          foreground: Paint()
                                            ..shader = LinearGradient(
                                              colors: Tcolor.secondryGradient,
                                            ).createShader(const Rect.fromLTWH(
                                                0.0, 0.0, 200.0, 70.0)),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      );
                                    }),
                              ],
                            ),
                            Expanded(
                              // Wrap the Image with Expanded
                              child: Image.asset(
                                'assets/img/Stepping up.png',
                                fit: BoxFit.fill,
                                height: 140,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.09,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 25),
                            height: media.width * 0.95,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(color: Colors.black, blurRadius: 2)
                                ]),
                            child: Row(
                              children: [
                                SimpleAnimationProgressBar(
                                  height: media.width * 0.9,
                                  width: media.width * 0.07,
                                  backgroundColor: Colors.grey.shade100,
                                  foregrondColor: Colors.purple,
                                  ratio: waterratio,
                                  direction: Axis.vertical,
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  duration: const Duration(seconds: 3),
                                  borderRadius: BorderRadius.circular(25),
                                  gradientColor: LinearGradient(
                                      colors: Tcolor.secondryGradient,
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter),
                                ),
                                // const SizedBox(
                                //   width: 15,
                                // ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Water Intake",
                                      style: TextStyle(
                                          color: Tcolor.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    ShaderMask(
                                      blendMode: BlendMode.srcIn,
                                      shaderCallback: (bounds) {
                                        return LinearGradient(
                                                colors: Tcolor.secondryGradient,
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight)
                                            .createShader(Rect.fromLTRB(0, 0,
                                                bounds.width, bounds.height));
                                      },
                                      child: ValueListenableBuilder(
                                          valueListenable: watertargetl,
                                          builder: (context, value, child) {
                                            return Text(
                                              watertargetl.value,
                                              style: TextStyle(
                                                  color: Tcolor.white
                                                      .withOpacity(0.7),
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 14),
                                            );
                                          }),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Suggetion",
                                      style: TextStyle(
                                        color: Tcolor.gray,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: waterArr.map((wObj) {
                                          var isLast = wObj == waterArr.last;
                                          return Row(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(vertical: 4),
                                                    width: 10,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      color: Tcolor
                                                          .secondryColor1
                                                          .withOpacity(0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                  if (!isLast)
                                                    DottedDashedLine(
                                                        height:
                                                            media.width * 0.078,
                                                        width: 0,
                                                        dashColor: Tcolor
                                                            .secondryColor1
                                                            .withOpacity(0.5),
                                                        axis: Axis.vertical)
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    wObj['title'].toString(),
                                                    style: TextStyle(
                                                      color: Tcolor.gray,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  ShaderMask(
                                                    blendMode: BlendMode.srcIn,
                                                    shaderCallback: (bounds) {
                                                      return LinearGradient(
                                                              colors: Tcolor
                                                                  .secondryGradient,
                                                              begin: Alignment
                                                                  .centerLeft,
                                                              end: Alignment
                                                                  .centerRight)
                                                          .createShader(
                                                              Rect.fromLTRB(
                                                                  0,
                                                                  0,
                                                                  bounds.width,
                                                                  bounds
                                                                      .height));
                                                    },
                                                    child: Text(
                                                      wObj['subtitle']
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Tcolor.white
                                                              .withOpacity(0.7),
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          );
                                        }).toList()),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                top: 20),
                            child: Row(
                              children: [
                                const Text('Set your \nprogress'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: Tcolor.secondryGradient),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (waterratio < 1) {
                                              waterratio = waterratio + 0.2;
                                            }
                                          });
                                        },
                                        icon: const Icon(Icons.add))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.05,
                    ),
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.maxFinite,
                              height: media.width * 0.45,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12, blurRadius: 2)
                                  ]),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sleep",
                                      style: TextStyle(
                                          color: Tcolor.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    ShaderMask(
                                      blendMode: BlendMode.srcIn,
                                      shaderCallback: (bounds) {
                                        return LinearGradient(
                                                colors: Tcolor.primaryGradient,
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight)
                                            .createShader(Rect.fromLTRB(0, 0,
                                                bounds.width, bounds.height));
                                      },
                                      child: Text(
                                        '$totalhour hour $totalminutes minutes',
                                        style: TextStyle(
                                            color:
                                                Tcolor.white.withOpacity(0.7),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14),
                                      ),
                                    ),
                                    const Spacer(),
                                    Image.asset("assets/img/sleep_grap.png",
                                        width: double.maxFinite,
                                        fit: BoxFit.fitWidth)
                                  ]),
                            ),
                            SizedBox(
                              height: media.width * 0.05,
                            ),
                            Container(
                              width: double.maxFinite,
                              height: media.width * 0.45,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12, blurRadius: 2)
                                  ]),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Calories",
                                      style: TextStyle(
                                          color: Tcolor.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    ShaderMask(
                                      blendMode: BlendMode.srcIn,
                                      shaderCallback: (bounds) {
                                        return LinearGradient(
                                                colors: Tcolor.primaryGradient,
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight)
                                            .createShader(Rect.fromLTRB(0, 0,
                                                bounds.width, bounds.height));
                                      },
                                      child: Text(
                                        calories.toString(),
                                        style: TextStyle(
                                            color:
                                                Tcolor.white.withOpacity(0.7),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: media.width * 0.2,
                                        height: media.width * 0.2,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              width: media.width * 0.15,
                                              height: media.width * 0.15,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors:
                                                        Tcolor.primaryGradient),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        media.width * 0.075),
                                              ),
                                              child: FittedBox(
                                                child: Text(
                                                  " Burn \n more",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Tcolor.white,
                                                      fontSize: 11),
                                                ),
                                              ),
                                            ),
                                            SimpleCircularProgressBar(
                                              progressStrokeWidth: 10,
                                              backStrokeWidth: 10,
                                              progressColors:
                                                  Tcolor.primaryGradient,
                                              backColor: Colors.grey.shade100,
                                              valueNotifier:
                                                  ValueNotifier(calories),
                                              startAngle: -180,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                            )
                          ]),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.1,
                ),
              ],
            ),
          )),
        ));
  }

  Future<List<PieChartSectionData>> showingSections() async {
    String bmi = await calculateBMI();
    double value = double.parse(bmi);
    return List.generate(
      2,
      (i) {
        var color0 = Tcolor.secondryColor1;

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0,
              value: value + 90,
              title: bmi,
              radius: 55,
              titlePositionPercentageOffset: 0.55,
              badgeWidget: const Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          case 1:
            return PieChartSectionData(
              color: Colors.white,
              value: 100 - value,
              title: '',
              radius: 45,
              titlePositionPercentageOffset: 0.55,
            );
          default:
            throw Error();
        }
      },
    );
  }
}

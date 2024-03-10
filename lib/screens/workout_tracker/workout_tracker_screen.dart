import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/db_functions/workoout_progress_function.dart';
import 'package:strongify/db_functions/workout_schedule.dart';
import 'package:strongify/screens/workout_tracker/workout_detail_screen.dart';
import 'package:strongify/screens/workout_tracker/workout_schedule.dart';
import 'package:strongify/utils/workout_tracker.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/what_train_row.dart';

class WorkoutTrackerScreen extends StatefulWidget {
  const WorkoutTrackerScreen({super.key});

  @override
  State<WorkoutTrackerScreen> createState() => _WorkoutTrackerScreenState();
}

class _WorkoutTrackerScreenState extends State<WorkoutTrackerScreen> {
  late var dayschedules = [];
  Future<void> loadSchedulesForSelectedDate() async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    var schedules = await retrieveSchedulesForDate(formattedDate);

    setState(() {
      dayschedules = schedules ?? [];
    });
  }

  String date1 = 'N/A',
      date2 = 'N/A',
      date3 = 'N/A',
      date4 = 'N/A',
      date5 = 'N/A',
      date6 = 'N/A',
      date7 = 'N/A';
  int value1 = 0,
      value2 = 0,
      value3 = 0,
      value4 = 0,
      value5 = 0,
      value6 = 0,
      value7 = 0;
  int touchedIndex = -1;

  get showingTooltipOnSpots => null;
  @override
  void initState() {
    super.initState();
    test();
  }

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
              // pinned: true,
              title: Text(
                "Workout Tracker",
                style: TextStyle(
                    color: Tcolor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Tcolor.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
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
                      Text(
                        "Workout Progress for Last 7 days",
                        style: TextStyle(
                            color: Tcolor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Container(
                    height: media.width * 0.5,
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                    decoration: BoxDecoration(
                        color: Tcolor.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 3)
                        ]),
                    child: BarChart(BarChartData(
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.grey,
                          tooltipHorizontalAlignment:
                              FLHorizontalAlignment.right,
                          tooltipMargin: 10,
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            String weekDay;
                            switch (group.x) {
                              case 0:
                                weekDay = date1;
                                break;
                              case 1:
                                weekDay = date2;
                                break;
                              case 2:
                                weekDay = date3;
                                break;
                              case 3:
                                weekDay = date4;
                                break;
                              case 4:
                                weekDay = date5;
                                break;
                              case 5:
                                weekDay = date6;
                                break;
                              case 6:
                                weekDay = date7;
                                break;
                              default:
                                throw Error();
                            }
                            return BarTooltipItem(
                              '$weekDay\n',
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: (rod.toY - 1).toString(),
                                  style: TextStyle(
                                    color: Tcolor.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        touchCallback: (FlTouchEvent event, barTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                barTouchResponse == null ||
                                barTouchResponse.spot == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex =
                                barTouchResponse.spot!.touchedBarGroupIndex;
                          });
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: getTitles,
                            reservedSize: 38,
                          ),
                        ),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingGroups(),
                      gridData: const FlGridData(show: false),
                    )),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Tcolor.primaryColor2.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Daily Workout Schedule",
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
                                      const WorkoutScheduleScreen(),
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
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "What Do You Want to Train",
                        style: TextStyle(
                            color: Tcolor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: whatArr.length,
                      itemBuilder: (context, index) {
                        var wObj = whatArr[index] as Map? ?? {};
                        return InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          WorkoutDetailScreen(dObj: wObj)));
                            },
                            child: WhatTrainRow(
                              wObj: wObj,
                              viewmore: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) =>
                                        WorkoutDetailScreen(dObj: wObj)));
                              },
                            ));
                      }),
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    var style = TextStyle(
      color: Tcolor.gray,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text(date1, style: style);
        break;
      case 1:
        text = Text(date2, style: style);
        break;
      case 2:
        text = Text(date3, style: style);
        break;
      case 3:
        text = Text(date4, style: style);
        break;
      case 4:
        text = Text(date5, style: style);
        break;
      case 5:
        text = Text(date6, style: style);
        break;
      case 6:
        text = Text(date7, style: style);
        break;
      default:
        text = Text('unavailable', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, value1.toDouble(), Tcolor.primaryGradient,
                isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, value2.toDouble(), Tcolor.secondryGradient,
                isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, value3.toDouble(), Tcolor.primaryGradient,
                isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, value4.toDouble(), Tcolor.secondryGradient,
                isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, value5.toDouble(), Tcolor.primaryGradient,
                isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, value6.toDouble(), Tcolor.secondryGradient,
                isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, value7.toDouble(), Tcolor.primaryGradient,
                isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartGroupData makeGroupData(
    int x,
    double y,
    List<Color> barColor, {
    bool isTouched = false,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          gradient: LinearGradient(
              colors: barColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Colors.green)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Tcolor.lightGray,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  Future<void> retrivedates() async {
    String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final last7days = await retrieveLast7DaysProgress(date);

    setState(() {
      if (last7days.isNotEmpty) value1 = last7days[0].progress.round();

      if (last7days.length >= 2) value2 = last7days[1].progress.round();
      if (last7days.length >= 3) value3 = last7days[2].progress.round();
      if (last7days.length >= 4) value4 = last7days[3].progress.round();
      if (last7days.length >= 5) value5 = last7days[4].progress.round();
      if (last7days.length >= 6) value6 = last7days[5].progress.round();
      if (last7days.length >= 7) value7 = last7days[6].progress.round();
    });
  }

  String removeYearFromDate(String date) {
    List<String> dateParts = date.split('-');
    if (dateParts.length == 3) {
      return '${dateParts[1]}-${dateParts[2]}';
    } else {
      return date;
    }
  }

  Future<void> setdateforchart() async {
    String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final last7days = await retrieveLast7DaysProgress(date);
    setState(() {
      if (last7days.isNotEmpty) date1 = removeYearFromDate(last7days[0].Date);
      if (last7days.length >= 2) date2 = removeYearFromDate(last7days[1].Date);
      if (last7days.length >= 3) date3 = removeYearFromDate(last7days[2].Date);
      if (last7days.length >= 4) date4 = removeYearFromDate(last7days[3].Date);
      if (last7days.length >= 5) date5 = removeYearFromDate(last7days[4].Date);
      if (last7days.length >= 6) date6 = removeYearFromDate(last7days[5].Date);
      if (last7days.length >= 7) date7 = removeYearFromDate(last7days[6].Date);
    });
  }

  Future<void> test() async {
    await setdateforchart();
    await retrivedates();
  }
}

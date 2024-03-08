import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/db_functions/db_functions.dart';
import 'package:strongify/db_functions/sleep_schedule.dart';
import 'package:strongify/functions/sleep_tracker_functions/sleep_schedule.dart';
import 'package:strongify/screens/sleep_tracker/sleep_add_alarm_screen.dart';

import '../../common_widget/round_button.dart';

class SleepScheduleScreen extends StatefulWidget {
  const SleepScheduleScreen({super.key});

  @override
  State<SleepScheduleScreen> createState() => _SleepScheduleScreenState();
}

class _SleepScheduleScreenState extends State<SleepScheduleScreen> {
  // CalendarAgendaController _calendarAgendaControllerAppBar =
  //     CalendarAgendaController();
  late DateTime _selectedDate;
  // Random random = Random();
  // String bedtime = '';
  // String alarmtime = '';

  List<int> showingTooltipOnSpots = [4];

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    updateSelectedDate(_selectedDate);
  }

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
              "assets/img/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Sleep Schedule",
          style: TextStyle(
              color: Tcolor.black, fontSize: 16, fontWeight: FontWeight.w700),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(20),
                    height: media.width * 0.4,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Tcolor.primaryColor2.withOpacity(0.4),
                          Tcolor.primaryColor1.withOpacity(0.4)
                        ]),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Ideal Hours for Sleep",
                                style: TextStyle(
                                  color: Tcolor.black,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "8hours 30minutes",
                                style: TextStyle(
                                    color: Tcolor.primaryColor2,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 110,
                                height: 35,
                                child: RoundButton(
                                    title: "Learn More",
                                    fontSize: 12,
                                    onPressed: () async {
                                      getsleephours();
                                    }),
                              )
                            ]),
                        Image.asset(
                          "assets/img/sleep_schedule.png",
                          width: media.width * 0.35,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Your Schedule",
                    style: TextStyle(
                        color: Tcolor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: CalendarAgenda(
                      selectedDayPosition: SelectedDayPosition.left,
                      weekDay: WeekDay.long,
                      fullCalendarScroll: FullCalendarScroll.horizontal,
                      fullCalendarDay: WeekDay.long,
                      selectedDateColor: Colors.green.shade900,
                      locale: 'en',
                      initialDate: DateTime.now(),
                      calendarEventColor: Colors.green,
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 140)),
                      lastDate: DateTime.now().add(const Duration(days: 60)),
                      events: List.generate(
                          100,
                          (index) => DateTime.now().subtract(
                              Duration(days: index * random.nextInt(5)))),
                      onDateSelected: (date) {
                        setState(() {
                          _selectedDate = date;
                          updateSelectedDate(date);
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                      width: media.width - 20,
                      height: 75,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Tcolor.gray),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                                width: 40,
                                height: 40,
                                child: Image.asset("assets/img/bed.png")),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Bed Time',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(bedtime)
                              ],
                            ),
                            SizedBox(
                              width: media.width * 0.2,
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      String formatteddate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(_selectedDate);

                                      await deleteSleepSchedule(formatteddate);
                                      setState(() {});
                                    },
                                    icon: const Icon(Icons.delete))
                              ],
                            )
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                      width: media.width - 20,
                      height: 75,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Tcolor.gray),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                                width: 40,
                                height: 40,
                                child: Image.asset("assets/img/bed.png")),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Alarm Time',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(alarmtime)
                              ],
                            ),
                            SizedBox(
                              width: media.width * 0.2,
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      String formatteddate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(_selectedDate);
                                      deleteSleepSchedule(formatteddate);
                                    },
                                    icon: const Icon(Icons.delete))
                              ],
                            )
                          ],
                        ),
                      )),
                ),
                Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Tcolor.secondryColor2.withOpacity(0.4),
                          Tcolor.secondryColor1.withOpacity(0.4)
                        ]),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You will get 8hours 10minutes\nfor tonight",
                          style: TextStyle(
                            color: Tcolor.black,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SimpleAnimationProgressBar(
                              height: 15,
                              width: media.width - 80,
                              backgroundColor: Colors.grey.shade100,
                              foregrondColor: Colors.purple,
                              ratio: 0.96,
                              direction: Axis.horizontal,
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: const Duration(seconds: 3),
                              borderRadius: BorderRadius.circular(7.5),
                              gradientColor: LinearGradient(
                                  colors: Tcolor.secondryGradient,
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight),
                            ),
                            Text(
                              "96%",
                              style: TextStyle(
                                color: Tcolor.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          print(_selectedDate);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SleepAddAlarmView(
                date: _selectedDate,
              ),
            ),
          );
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: Tcolor.secondryGradient),
              borderRadius: BorderRadius.circular(27.5),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
              ]),
          alignment: Alignment.center,
          child: Icon(
            Icons.add,
            size: 20,
            color: Tcolor.white,
          ),
        ),
      ),
    );
  }

  // Future<void> updateSelectedDate(DateTime date) async {
  //   String formatteddate = DateFormat('yyyy-MM-dd').format(date);
  //   SleepProgres? sleepSchedule = await retriveSleepSchedule(formatteddate);

  //   if (sleepSchedule != null) {
  //     setState(() {
  //       int timeindiactorforalarm = sleepSchedule.wakeuptime.hour;

  //       String getalarmtime =
  //           DateFormat('HH:mm').format(sleepSchedule.wakeuptime);
  //       int timeindicatorforbed = sleepSchedule.wakeuptime.hour;
  //       String getbedtime = DateFormat('HH:mm').format(sleepSchedule.sleeptime);

  //       if (timeindiactorforalarm >= 12) {
  //         alarmtime = '$getalarmtime, P.M';
  //       } else {
  //         alarmtime = '$getalarmtime, A.M';
  //       }
  //       if (timeindicatorforbed >= 12) {
  //         bedtime = '$getbedtime, P.M';
  //       } else {
  //         bedtime = '$getbedtime, A.M';
  //       }
  //     });
  //   } else {
  //     // Handle the case where sleepSchedule is null,
  //     setState(() {
  //       alarmtime = 'Set your schedule';
  //       bedtime = 'Set your schedule';
  //     });
  //   }
  // }
}

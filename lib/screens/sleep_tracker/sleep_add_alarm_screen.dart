import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/db_functions/sleep_schedule.dart';
import 'package:strongify/db_model/model.dart';
import '../../common_widget/round_button.dart';

class SleepAddAlarmView extends StatefulWidget {
  final DateTime date;
  const SleepAddAlarmView({super.key, required this.date});

  @override
  State<SleepAddAlarmView> createState() => _SleepAddAlarmViewState();
}

class _SleepAddAlarmViewState extends State<SleepAddAlarmView> {
  bool positive = false;
  DateTime wakeuptime = DateTime.now();
  DateTime sleeptime = DateTime.now();
  int selectedHour = DateTime.now().hour;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    int selectedHour = DateTime.now().hour;
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
        title: Text(
          "Add Alarm",
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
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              SizedBox(
                child: Image.asset('assets/img/Bed_Add.png'),
                width: 20,
                height: 20,
              ),
              Text(
                " Bed Time",
                style: TextStyle(
                    color: Tcolor.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: media.width * 0.35,
            child: CupertinoDatePicker(
              onDateTimeChanged: (newTime) {
                setState(() {
                  sleeptime = newTime;
                });
              },
              initialDateTime: DateTime.now(),
              use24hFormat: false,
              minuteInterval: 1,
              mode: CupertinoDatePickerMode.time,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                child: Image.asset('assets/img/HoursTime.png'),
                width: 20,
                height: 20,
              ),
              Text(
                " Wake up Time",
                style: TextStyle(
                    color: Tcolor.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: media.width * 0.35,
            child: CupertinoDatePicker(
              onDateTimeChanged: (newTime) {
                setState(() {
                  //GETTING TIME ONLY AS STRING
                  // String test = DateFormat('HH:mm').format(newTime);
                  // print(test);
                  wakeuptime = newTime;
                });
              },
              initialDateTime: DateTime.now().add(Duration(days: 1)).subtract(
                    Duration(minutes: DateTime.now().minute),
                  ),
              use24hFormat: false,
              minuteInterval: 1,
              mode: CupertinoDatePickerMode.time,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          const Spacer(),
          Text('$sleeptime'),
          Text('$wakeuptime'),
          RoundButton(
              title: "Add",
              onPressed: () async {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(widget.date);
                Duration duration = wakeuptime.difference(sleeptime);
                int totalHours = duration.inHours;
                int remainingMinutes = duration.inMinutes % 60;
                String formattedDuration = '$totalHours.$remainingMinutes';
                double sleepdutarion = double.parse(formattedDuration);
                print('Formatted Duration: $sleepdutarion');
                final sleepschedule = SleepProgres(
                    formattedDate, sleeptime, wakeuptime, sleepdutarion);
                addsleepschedule(sleepschedule);
                setState(() {});
                Navigator.of(context).pop();
              }),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}

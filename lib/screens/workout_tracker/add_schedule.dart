import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/common_widget/show_warning.dart';
import 'package:strongify/db/db_functions.dart';
import 'package:strongify/db_model/model.dart';
import 'package:strongify/screens/workout_tracker/workout_schedule.dart';
import '../../common/common.dart';
import '../../common_widget/round_button.dart';

class AddScheduleView extends StatefulWidget {
  final DateTime date;

  const AddScheduleView({super.key, required this.date});

  @override
  State<AddScheduleView> createState() => _AddScheduleViewState();
}

class _AddScheduleViewState extends State<AddScheduleView> {
  @override
  void initState() {
    super.initState();
    String formattedDate = DateFormat('yyyy-MM-dd').format(widget.date);

    retrieveSchedulesForDate(formattedDate);
  }

  var list = ['Full body', 'Upper body', 'AB workout'];
  String selectedOption = 'Full body';
  // ignore: prefer_typing_uninitialized_variables
  late DateTime time;
  late String actualtime;
  @override
  Widget build(BuildContext context) {
    var newdate = dateToString(widget.date, formatStr: " dd MMMM yyyy");
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
        title: Text(
          "Add Schedule",
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
          Row(
            children: [
              Image.asset(
                "assets/img/date.png",
                width: 20,
                height: 20,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                dateToString(widget.date, formatStr: "E, dd MMMM yyyy"),
                style: TextStyle(color: Tcolor.gray, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Time",
            style: TextStyle(
                color: Tcolor.black, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: media.width * 0.35,
            child: CupertinoDatePicker(
              onDateTimeChanged: (newTime) {
                setState(() {
                  time = newTime;
                });
              },
              initialDateTime: DateTime.now(),
              use24hFormat: false,
              minuteInterval: 1,
              mode: CupertinoDatePickerMode.time,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Details Workout",
            style: TextStyle(
                color: Tcolor.black, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              width: media.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Tcolor.gray.withOpacity(0.06)),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: Image(
                          image: AssetImage('assets/img/choose_workout.png')),
                    ),
                  ),
                  const Text('Choose workout'),
                  DropdownButton<String>(
                    underline: Container(),
                    value: selectedOption,
                    icon: const Icon(Icons.keyboard_arrow_right),
                    items: list.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Spacer(),
          RoundButton(
              title: "Save",
              onPressed: () async {
                // TimeOfDay timeOnly = TimeOfDay.fromDateTime(time);
                // String formattedTime = '${timeOnly.hour}:${timeOnly.minute}';
                // ignore: unnecessary_null_comparison
                if (time != null) {
                  int hour = time!.hour;
                  int minute = time!.minute;
                  actualtime = '$hour:$minute';
                  print('Selected Time: $hour:$minute');
                  print(
                      'you have added a wrrkout for $selectedOption on ${newdate} @ $hour:$minute');
                } else {
                  print("Time is null. Please select a valid time.");
                }
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(widget.date);
                // String formattedDateTime =
                //     DateFormat('yyyy-MM-dd ').format(widget.date);
                print('formatted date : $formattedDate ');
                // print('formated time $formattedTime');
                final scheduleadd = Schedule(
                    date: formattedDate,
                    time: actualtime,
                    workout: selectedOption);
                await addschedule(
                  scheduleadd,
                );
                // await retrieveSchedulesForDate(formattedDate);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => WorkoutScheduleScreen(
                          currentDate: widget.date,
                          currentdate: formattedDate,
                        )));
                showWarningDialog(
                    context,
                    'you have added a $selectedOption workout  on ${newdate} @ $actualtime',
                    '', () {
                  Navigator.of(context).pop();
                });
              }),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}

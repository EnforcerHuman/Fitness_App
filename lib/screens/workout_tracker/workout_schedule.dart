// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/db/db_functions.dart';

import 'package:strongify/screens/workout_tracker/add_schedule.dart';

class WorkoutScheduleScreen extends StatefulWidget {
  final String? currentdate;
  final DateTime? currentDate;
  const WorkoutScheduleScreen({super.key, this.currentdate, this.currentDate});

  @override
  _WorkoutScheduleScreenState createState() => _WorkoutScheduleScreenState();
}

class _WorkoutScheduleScreenState extends State<WorkoutScheduleScreen> {
  final CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();

  late DateTime _selectedDateAppBBar;
  late var dayschedules = [];
  Random random = Random();
  late String time;
  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
    _loadSchedulesForSelectedDate();
  }

  Future<void> _loadSchedulesForSelectedDate() async {
    String formattedDate;
    if (widget.currentdate != null) {
      formattedDate = widget.currentdate!;
    } else {
      formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDateAppBBar);
    }
    var schedules = await retrieveSchedulesForDate(formattedDate);
    print('sendig date to retive $formattedDate');
    print('widget.date ${widget.currentdate}');
    setState(() {
      dayschedules = schedules ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        focusColor: Tcolor.secondryColor1,
        backgroundColor: Tcolor.secondryColor2,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => AddScheduleView(date: _selectedDateAppBBar)));
        },
        child: const Icon(Icons.add),
      ),
      appBar: CalendarAgenda(
        controller: _calendarAgendaControllerAppBar,
        appbar: true,
        selectedDayPosition: SelectedDayPosition.left,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        weekDay: WeekDay.long,
        fullCalendarScroll: FullCalendarScroll.horizontal,
        fullCalendarDay: WeekDay.long,
        selectedDateColor: Colors.green.shade900,
        locale: 'en',
        initialDate: widget.currentDate ?? DateTime.now(),
        calendarEventColor: Colors.green,
        firstDate: DateTime.now().subtract(const Duration(days: 140)),
        lastDate: DateTime.now().add(const Duration(days: 60)),
        events: List.generate(
            100,
            (index) => DateTime.now()
                .subtract(Duration(days: index * random.nextInt(5)))),
        onDateSelected: (date) async {
          _selectedDateAppBBar = date;
          String formattedDate =
              DateFormat('yyyy-MM-dd').format(_selectedDateAppBBar);
          var schedules = await retrieveSchedulesForDate(formattedDate);
          setState(() {
            dayschedules = schedules ?? [];
          });
        },
      ),
      body: dayschedules.isNotEmpty
          ? ListView.builder(
              itemCount: dayschedules.length,
              itemBuilder: (context, index) {
                final schedule = dayschedules[index];

                return ListTile(
                  leading: const Icon(Icons.fitness_center),
                  title: Text('Workout: ${schedule.workout}'),
                  subtitle: Text('Time: ${schedule.time.toString()}'),
                  trailing: IconButton(
                    onPressed: () {
                      // Handle delete logic here
                    },
                    icon: const Icon(Icons.delete_forever_outlined),
                  ),
                );
              },
            )
          : const Center(
              child: Text("No schedules for this date."),
            ),
    );
  }
}

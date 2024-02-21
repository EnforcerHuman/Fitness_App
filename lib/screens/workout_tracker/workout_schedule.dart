import 'dart:math';

import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:strongify/db/db_functions.dart';

import 'package:strongify/screens/workout_tracker/add_schedule.dart';

class WorkoutScheduleScreen extends StatefulWidget {
  WorkoutScheduleScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WorkoutScheduleScreenState createState() => _WorkoutScheduleScreenState();
}

class _WorkoutScheduleScreenState extends State<WorkoutScheduleScreen> {
  final CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();

  late DateTime _selectedDateAppBBar;
  late var dayschedules = [];
  Random random = Random();

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
          onPressed: () {},
        ),
        weekDay: WeekDay.long,
        fullCalendarScroll: FullCalendarScroll.horizontal,
        fullCalendarDay: WeekDay.long,
        selectedDateColor: Colors.green.shade900,
        locale: 'en',
        initialDate: DateTime.now(),
        calendarEventColor: Colors.green,
        firstDate: DateTime.now().subtract(Duration(days: 140)),
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
                  leading: Icon(Icons.fitness_center), // Example icon
                  title: Text(schedule.workout),
                  subtitle: Text(schedule.time.toString()),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete_forever_outlined)),
                );
              },
            )
          : Center(
              child: Text("No schedules for this date."),
            ),
    );
  }
}

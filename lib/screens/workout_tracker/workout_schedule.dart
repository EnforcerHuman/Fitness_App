import 'dart:math';

import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
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
          onDateSelected: (date) {
            setState(() {
              _selectedDateAppBBar = date;
            });
          },
          // calendarLogo: Image.network(
          //   'https://www.kindpng.com/picc/m/355-3557482_flutter-logo-png-transparent-png.png',
          //   scale: 5.0,
          // ),
          // selectedDayLogo: const NetworkImage(
          //   'https://www.kindpng.com/picc/m/355-3557482_flutter-logo-png-transparent-png.png',
          //   scale: 15.0,
          // ),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: ((context, index) {
              return ListTile(
                leading: Text('leading'),
              );
            })));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:strongify/db_functions/workoout_progress_function.dart';

ValueNotifier<String> date1 = ValueNotifier<String>('N/A');
ValueNotifier<String> date2 = ValueNotifier<String>('N/A');
ValueNotifier<String> date3 = ValueNotifier<String>('N/A');
ValueNotifier<String> date4 = ValueNotifier<String>('N/A');
ValueNotifier<String> date5 = ValueNotifier<String>('N/A');
ValueNotifier<String> date6 = ValueNotifier<String>('N/A');
ValueNotifier<String> date7 = ValueNotifier<String>('N/A');

ValueNotifier<int> value1 = ValueNotifier<int>(0);
ValueNotifier<int> value2 = ValueNotifier<int>(0);
ValueNotifier<int> value3 = ValueNotifier<int>(0);
ValueNotifier<int> value4 = ValueNotifier<int>(0);
ValueNotifier<int> value5 = ValueNotifier<int>(0);
ValueNotifier<int> value6 = ValueNotifier<int>(0);
ValueNotifier<int> value7 = ValueNotifier<int>(0);

Future<void> retrivedates() async {
  String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final last7days = await retrieveLast7DaysProgress(date);

  if (last7days.isNotEmpty) value1.value = last7days[0].progress.round();

  if (last7days.length >= 2) value2.value = last7days[1].progress.round();
  if (last7days.length >= 3) value3.value = last7days[2].progress.round();
  if (last7days.length >= 4) value4.value = last7days[3].progress.round();
  if (last7days.length >= 5) value5.value = last7days[4].progress.round();
  if (last7days.length >= 6) value6.value = last7days[5].progress.round();
  if (last7days.length >= 7) value7.value = last7days[6].progress.round();
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

  if (last7days.isNotEmpty) date1.value = removeYearFromDate(last7days[0].Date);
  if (last7days.length >= 2) {
    date2.value = removeYearFromDate(last7days[1].Date);
  }
  if (last7days.length >= 3) {
    date3.value = removeYearFromDate(last7days[2].Date);
  }
  if (last7days.length >= 4) {
    date4.value = removeYearFromDate(last7days[3].Date);
  }
  if (last7days.length >= 5) {
    date5.value = removeYearFromDate(last7days[4].Date);
  }
  if (last7days.length >= 6) {
    date6.value = removeYearFromDate(last7days[5].Date);
  }
  if (last7days.length >= 7) {
    date7.value = removeYearFromDate(last7days[6].Date);
  }
}

Future<void> setvalues() async {
  await setdateforchart();
  await retrivedates();
}

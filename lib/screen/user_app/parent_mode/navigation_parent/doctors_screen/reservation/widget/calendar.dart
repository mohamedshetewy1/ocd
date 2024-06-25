import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:ocdear/utils/colors.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      width: 370,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.normal)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Calendar(
          startOnMonday: true,
          weekDays: const ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'hg', 'So'],
          isExpandable: false,
          eventDoneColor: Colors.green,
          selectedColor: AppColors.lightActive,
          selectedTodayColor: AppColors.lightActive,
          todayColor: Colors.blue,
          eventColor: null,
          locale: 'de_DE',
          todayButtonText: 'Heute',
          allDayEventText: 'Ganztägig',
          multiDayEndText: 'Ende',
          isExpanded: true,
          expandableDateFormat: 'EEEE, dd. MMMM yyyy',
          datePickerType: DatePickerType.date,
          dayOfWeekStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
        ),
      ),
    );
  }
}

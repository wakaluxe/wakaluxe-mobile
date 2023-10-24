import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

import 'package:wakaluxe/src/features/Profile/presentation/trip_cubit/cubit/trip_cubit.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({
    super.key,
  });

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  DateTime _focusedDay = DateTime.now().subtract(const Duration(days: 1));
  DateTime? _selectedDay;

  final _dateController = ScrollController();
  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
  }

  final days = getCalendarData();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SizedBox(
      height: 100.h,
      child: TableCalendar(
        firstDay: DateTime.now().subtract(const Duration(days: 30)),
        lastDay: DateTime.now(),
        focusedDay: _focusedDay,
        calendarFormat: CalendarFormat.week,
        headerVisible: false,
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
            color: context.colorScheme.primary,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: context.colorScheme.primary,
            shape: BoxShape.circle,
          ),
        ),
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.
          context.read<TripCubit>().fetchMyTripsByDate(page: 1, date: day);
          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
      ),
      // ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   controller: _dateController,
      //   itemCount: days.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     final day = days[index];
      //     return GestureDetector(
      //       onTap: () {
      //         setState(() {
      //           _selectedDay = day['day'] as int;
      //         });
      //       },
      //       child:
      // Container(
      //         width: 70.w,
      //         height: double.maxFinite,
      //         margin: EdgeInsets.symmetric(horizontal: 5.w),
      //         decoration: BoxDecoration(
      //           color: context.colorScheme.surface.withOpacity(0.8),
      //           borderRadius: BorderRadius.circular(16.r),
      //           border: Border.all(
      //             color: _selectedDay == day['day']
      //                 ? context.colorScheme.primary
      //                 : context.colorScheme.onInverseSurface,
      //             width: 2,
      //           ),
      //         ),
      //         child: Column(
      //           children: [
      //             Text(
      //               '${day['daysInWeek']}',
      //               style: theme.subtitle,
      //             ),
      //             6.vGap,
      //             Expanded(
      //               child: Container(
      //                 alignment: Alignment.center,
      //                 width: double.maxFinite,
      //                 decoration: BoxDecoration(
      //                   color: context.colorScheme.outlineVariant.withOpacity(0.4),
      //                   borderRadius: BorderRadius.circular(16.r),
      //                 ),
      //                 child: Text(
      //                   '${day['day']}',
      //                   style: theme.subtitle3,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

List<Map<String, Object>> getCalendarData() {
  final today = DateTime.now();
  final firstDay = DateTime.utc(today.year, today.month);
  final lastDay = DateTime.utc(today.year, today.month + 1);
  final days = lastDay.difference(firstDay).inDays;
  final daysInMonth = List<DateTime>.generate(
    days,
    (index) => firstDay.add(Duration(days: index)),
  );
  final formattedDays = daysInMonth
      .map(
        (e) => {
          'daysInWeek': DateFormat('EEEE').format(e).replaceFirst('day', ''),
          'day': e.day
        },
      )
      .toList();
  return formattedDays;
}

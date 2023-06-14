import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:wakaluxe/src/common/widgets/wakalux_back_button.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/Profile/presentation/widgets/wakalux_trip_detail.dart';

@RoutePage()
class MyTrip extends StatelessWidget {
  const MyTrip({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Today',
          style: theme.body1,
        ),
        leading: const WakaluxBackButton(),
        actions: [
          SvgPicture.asset(Constants.searchIcon),
          29.hGap,
          SvgPicture.asset(Constants.calendarIcon),
          26.hGap,
        ],
      ),
      body: Column(
        children: <Widget>[
          const DateWidget(),
          35.vGap,
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: context.scheme.surface,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const WakaluxeTripDetails(
                      pickUpLocation: 'Zoatoupsi',
                      dropOffLocation: 'Etoudi',
                      tripState: TripState.completed,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class DateWidget extends StatefulWidget {
  const DateWidget({
    super.key,
  });

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  final _focusedDay = DateTime.now().day;
  int _selectedDay = DateTime.now().day;
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
      height: 70.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _dateController,
        itemCount: days.length,
        itemBuilder: (BuildContext context, int index) {
          final day = days[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDay = day['day'] as int;
              });
            },
            child: Container(
              width: 70.w,
              height: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                color: context.scheme.surface.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: _selectedDay == day['day']
                      ? context.scheme.primary
                      : context.scheme.onInverseSurface,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    '${day['daysInWeek']}',
                    style: theme.subtitle,
                  ),
                  6.vGap,
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: context.scheme.outlineVariant.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        '${day['day']}',
                        style: theme.subtitle3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
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

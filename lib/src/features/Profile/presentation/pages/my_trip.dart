import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/Profile/presentation/widgets/wakalux_trip_detail.dart';

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
        leading: GestureDetector(
          onTap: () => context.popRoute(),
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        actions: [
          SvgPicture.asset(Constants.searchIcon),
          29.hGap,
          SvgPicture.asset(Constants.calendarIcon),
          26.hGap,
        ],
      ),
      body: Column(
        children: <Widget>[
          DateWidget(theme: theme),
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

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
    required this.theme,
  });

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 70.w,
            height: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              color: context.scheme.surface.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: context.scheme.onInverseSurface),
            ),
            child: Column(
              children: [
                Text(
                  'Sun',
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
                      '12',
                      style: theme.subtitle3,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

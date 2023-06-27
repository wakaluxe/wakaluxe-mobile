import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wakaluxe/src/common/widgets/wakalux_back_button.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/Profile/presentation/trip_cubit/cubit/trip_cubit.dart';
import 'package:wakaluxe/src/features/Profile/presentation/widgets/date_widget.dart';
import 'package:wakaluxe/src/features/Profile/presentation/widgets/wakalux_trip_detail.dart';

@RoutePage()
class MyTrip extends StatefulWidget {
  const MyTrip({super.key});

  @override
  State<MyTrip> createState() => _MyTripState();
}

class _MyTripState extends State<MyTrip> {
  @override
  void initState() {
    context.read<TripCubit>().fetchMyTrips(page: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocListener<TripCubit, TripsState>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Today',
            style: theme.body1,
          ),
          leading: const WakaluxBackButton(),
          actions: [
            GestureDetector(
              onTap: ()=> _handlePickDate(context),
              child: SvgPicture.asset(Constants.calendarIcon),
            ),
            26.hGap,
          ],
        ),
        body: Column(
          children: <Widget>[
            const DateWidget(),
            35.vGap,
            BlocBuilder<TripCubit, TripsState>(
              builder: (context, state) {
                if (state.status == TripStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state.status == TripStatus.error) {
                  return const Center(
                    child: Text('Error'),
                  );
                }
                final trips = state.trips;
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: trips.length,
                    itemBuilder: (context, index) {
                      final trip = trips[index];
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: context.scheme.surface,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(
                                  0,
                                  3,
                                ), // changes position of shadow
                              ),
                            ],
                          ),
                          child: WakaluxeTripDetails(
                            pickUpLocation: trip.pickUp,
                            dropOffLocation: trip.destination,
                            tripState: trip.state,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> _handlePickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      await context.read<TripCubit>().fetchMyTripsByDate(page: 1, date: date);
    }
  }
}
dfdfgdfgdfgdfg
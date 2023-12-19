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
              onTap: () => _handlePickDate(context),
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
                final trips = state.trips!.data!.data;

                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: trips!.length,
                    itemBuilder: (context, index) {
                      final trip = trips[index];
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: RideInfoBox(
                          rideLocation: 'trip.endLocation.',
                          rideTime: '${trip.duration!}' ' mins',
                          rideName: '${trip.name}',
                          price: '${trip.price!}',
                        ),
                        /*         Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: context.colorScheme.surface,
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
                            pickUpLocation: '${trip.startLocation!.coordinates}',
                            dropOffLocation: '${trip.endLocation!.coordinates}',
                            tripState: trip.status!,
                          ),
                        ),
                 */
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handlePickDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        context.read<TripCubit>().fetchMyTripsByDate(page: 1, date: value);
      }
    });
  }
}

class RideInfoBox extends StatelessWidget {
  const RideInfoBox({
    required this.rideName,
    required this.rideTime,
    required this.rideLocation,
    required this.price,
    super.key,
  });
  final String rideName;
  final String rideTime;
  final String rideLocation;

  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(
                0,
                3,
              ),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Text(
                    rideName,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                  
                    ),
                  ),
                ),
                Text(
                  rideTime,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  rideLocation,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$price CFA',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Price',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

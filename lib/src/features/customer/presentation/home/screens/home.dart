// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wakaluxe/data/dummy.dart';
import 'package:wakaluxe/src/common/Utils/wakalux_icons_icons.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakaluxe_driver_card.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/screens/wakaluxe_home_sheets.dart';

// List<Map<String, dynamic>> data = []

@RoutePage(name: 'Home')
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scheme.onBackground,
      body: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.onTrip) {
              context.showSnackBar('Will be able to get directions in 5s');
            }
            if (state.getDirections) {
              context.showSnackBar(
                'Click, Payment bottom will show in 10s',
              );
            }
          },
          builder: (context, state) {
            final data = getDriverData();
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          //  remove and replace with hamburger icon
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                color: context.scheme.background,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                Icons.menu,
                                color: context.scheme.onBackground,
                              ),
                            ),
                          ),
                          8.hGap,
                          Expanded(
                            flex: 4,
                            child: SizedBox(
                              child: (state.getDirections ||
                                      state.onTrip ||
                                      state.payfare ||
                                      state.showBookingDetails)
                                  ? Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: context.scheme.background,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const Text(
                                        'Driver eaching Destination in 5mins',
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  : WakaluxeLocationWidget(
                                      leading: Icon(
                                        Icons.person,
                                        color: context.scheme.primary,
                                      ),
                                      trainling: Icon(
                                        Icons.close,
                                        color: context.scheme.onBackground,
                                      ),
                                      message: 'Location Coordimates',
                                      onTap: () {
                                        debugPrint('Testing out');
                                      },
                                    ),
                            ),
                          ),
                          8.hGap,
                          const Expanded(
                            child: WakaluxeProfileImage(
                              imageUrl: 'https://placeimg.com/640/480/any',
                            ),
                          ),
                        ],
                      ),
                      5.vGap,
                      if (state.getDirections ||
                          state.onTrip ||
                          state.payfare ||
                          state.showBookingDetails)
                        0.vGap
                      else
                        Row(
                          children: [
                            Expanded(child: 30.hGap),
                            Expanded(
                              flex: 4,
                              child: SizedBox(
                                child: WakaluxeLocationWidget(
                                  leading: Icon(
                                    WakaluxIcons.location,
                                    color: context.scheme.error,
                                  ),
                                  trainling: Icon(
                                    Icons.close,
                                    color: context.scheme.onBackground,
                                  ),
                                  message: 'Destination Coordimates',
                                  onTap: () {
                                    WakaluxeBottomSheets
                                        .showSuggestedRidesModalSheet(
                                      context,
                                      data: suggestedRides,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Expanded(child: 30.hGap),
                          ],
                        ),

                      // will handle a bottom sheet and a modal sheet
                    ],
                  ),
                ),
                if (state.selectDriver)
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: WakaluxeButton(
                        text: 'Select a driver',
                        action: () {
                          context.read<HomeBloc>().add(
                                SelectDriverEvent(
                                  selectDriver: !state.selectDriver,
                                ),
                              );
                          context
                              .read<HomeBloc>()
                              .add(ShowDriversEvent(showDrivers: true));
                        },
                        color: context.scheme.tertiary,
                        textColor: context.scheme.onTertiary,
                      ),
                    ),
                  ),
                if (state.showDrivers)
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: context.height * 0.34,
                      width: context.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          //dummy data to be removed
                          final driver = data[index];
                          return WakaluxCard(
                            child: WakaluxeBookingDetails(
                              action: () {
                                context.read<HomeBloc>().add(
                                      HomeInitialEvent(),
                                    ); // show dialof to confirm ride
                                WakaluxeBottomSheets.showConfirmDialog(
                                  context,
                                );
                              },
                              driverImage: driver['driverImage'] as String,
                              driverName: driver['driverName'] as String,
                              rating: 4.0,
                              recommended: 30,
                              distance: double.parse(
                                driver['distance'].toString(),
                              ).toStringAsFixed(2),
                              price: driver['price'] as String,
                              time: '5',
                              imageLiknks: images,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (state.showBookingDetails)
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: WakaluxCard(
                      child: WakaluxeCancleRide(
                        driverImage: 'https://placeimg.com/640/480/nature',
                        driverName: 'Ayuko Peters',
                        dropOffLocation: 'Avenue des banques',
                        paymentAmount: '500',
                        paymentMethod: 'MTN Mobile Money',
                        pickUpLocation: 'Dispensaire Messasi',
                        rating: 4.0,
                        timeLeft: 5,
                        action: () {
                          context.read<HomeBloc>().add(
                                HomeInitialEvent(),
                              );
                          WakaluxeBottomSheets.showRemarkSheet(
                            context,
                            () {
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                if (state.onTrip)
                  const Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: WakaluxCard(
                      child: WakaluxeOnTrip(
                        driverImage: 'https://placeimg.com/640/480/nature',
                        driverName: 'Ayuko Peters',
                        rating: 4,
                      ),
                    ),
                  ),
                if (state.getDirections)
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: WakaluxeButton(
                        text: 'Get Directions',
                        action: () {
                          WakaluxeBottomSheets.showDiretionSheet(context);
                        },
                        color: context.scheme.tertiary,
                        textColor: context.scheme.onTertiary,
                      ),
                    ),
                  ),
                if (state.payfare)
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: WakaluxeButton(
                        text: 'Pay fare',
                        action: () {
                          context.showSnackBar(
                            'Will still to move to payment screen',
                          );
                          //for now will just reset
                          context.read<HomeBloc>().add(
                                HomeInitialEvent(),
                              );
                        },
                        color: context.scheme.error,
                        textColor: context.scheme.onTertiary,
                      ),
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }

// function to handle modal buttom sheet
}

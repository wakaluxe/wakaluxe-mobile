import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/driver/domain/cubit/driver_home/driver_home_cubit.dart';
import 'package:wakaluxe/src/features/driver/domain/cubit/driver_home/driver_home_state.dart';
import 'package:wakaluxe/src/features/driver/presentation/screens/sheets/driver_home_sheets.dart';

@RoutePage(name: 'DriverHome')
class DriverHome extends StatelessWidget {
  DriverHome({super.key});
  final cubit = DriverHomeCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scheme.onBackground,
      body: SafeArea(
        child: BlocBuilder<DriverHomeCubit, DriverHomeState>(
          bloc: cubit,
          builder: (context, state) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          //  remove and replace with hamburger icon
                          GestureDetector(
                            onTap: () {
                              context.router.pushNamed('/rent-a-car');
                            },
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
                          20.hGap,
                          Expanded(
                            flex: 4,
                            child: SizedBox(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: context.scheme.background,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'Total earned today',
                                      style: context.bodySm,
                                    ),
                                    5.vGap,
                                    Text(
                                      '30,000XAF',
                                      style: context.bodyMdBold,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          20.hGap,
                          WakaluxeProfileImage(
                            onTap: () {
                              context.router.pushNamed('/driver_login');
                            },
                            imageUrl: 'https://placeimg.com/640/480/any',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (state.isOnline)
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: cubit.toogleIsOnLine,
                        child: Row(
                          children: [
                            const WakaluxeRoundedButton(
                              text: 'GO',
                            ),
                            20.hGap,
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: context.scheme.background,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Hey, You're Online",
                                  style: context.bodyMd,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                if (state.newOrder)
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: WakaluxCard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New Order',
                              style: context.titleLgBold,
                            ),
                            10.vGap,
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WakaluxeOrderDetails(
                                  title: 'DISTANCE',
                                  value: '5.5km',
                                ),
                                WakaluxeOrderDetails(
                                  title: 'TIME',
                                  value: '3 mins',
                                ),
                                WakaluxeOrderDetails(
                                  title: 'PRICE',
                                  value: '300XAF',
                                ),
                              ],
                            ),
                            10.vGap,
                            Divider(
                              color: context.scheme.onBackground,
                              thickness: 0.5,
                            ),
                            10.vGap,
                            const WakaluxeTripDetails(
                              pickUpLocation: 'Messasi Zouatoupsi',
                              dropOffLocation: 'Dove Mendong',
                            ),
                            25.vGap,
                            SizedBox(
                              width: context.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  WakaluxeButtonMedium(
                                    text: 'Reject',
                                    width: 0.4,
                                    color: context.scheme.errorContainer,
                                    textColor: context.scheme.error,
                                  ),
                                  WakaluxeButtonMedium(
                                    text: 'Accept',
                                    width: 0.4,
                                    color: context.scheme.tertiary,
                                    textColor: context.scheme.onTertiary,
                                    action: cubit.toggleAcceptRide,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                if (state.acceptRide)
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: WakaluxCard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            const WakaluxePerson(
                              userImage: 'https://placeimg.com/640/480/any',
                            ),
                            10.vGap,
                            Divider(
                              color: context.scheme.onBackground,
                              thickness: 0.5,
                            ),
                            10.vGap,
                            const Text('3mins | 1.5 miles away'),
                            20.vGap,
                            WakaluxeButton(
                              text: 'Start',
                              color: context.scheme.tertiary,
                              textColor: context.scheme.onTertiary,
                              action: () {
                                cubit.changeAcceptRide();
                                WakaluxeDriverButtomSheets.showPickUpPointSheet(
                                  context,
                                );
                                Future.delayed(const Duration(seconds: 3), () {
                                  Navigator.of(context).pop();
                                  WakaluxeDriverButtomSheets
                                      .showDriverDetailsSheet(
                                    context,
                                  ).then((value) {
                                    WakaluxeDriverButtomSheets
                                            .showTerminatedSheet(context)
                                        .then((value) {
                                      cubit.toogltInitial();
                                    });
                                  });
                                });
                              },
                            )
                          ],
                        ),
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
}

class WakaluxeOrderDetails extends StatelessWidget {
  const WakaluxeOrderDetails({
    required this.title,
    required this.value,
    super.key,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.bodyLgGray,
        ),
        10.vGap,
        Text(
          value,
          style: context.bodyMdBold,
        ),
      ],
    );
  }
}

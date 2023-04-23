import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/data/dummy.dart';
import 'package:wakaluxe/src/common/Utils/wakalux_icons_icons.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/driver_card.dart';
import 'package:wakaluxe/src/common/widgets/wakalux_card.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/screens/buttom_sheets.dart';

// List<Map<String, dynamic>> data = []

@RoutePage(name: 'Home')
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scheme.onBackground,
      body: SafeArea(
        child: Stack(
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
                        child: LocationWidget(
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
                      8.hGap,
                      const Expanded(
                        child: ProfileImage(
                          imageUrl: 'https://placeimg.com/640/480/any',
                        ),
                      ),
                    ],
                  ),
                  5.vGap,
                  Row(
                    children: [
                      Expanded(child: 30.hGap),
                      Expanded(
                        flex: 4,
                        child: LocationWidget(
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
                            WakaluxeBottomSheets.showSuggestedRidesModalSheet(
                              context,
                              data: suggestedRides,
                            );
                          },
                        ),
                      ),
                      Expanded(child: 30.hGap),
                    ],
                  ),

                  // will handle a bottom sheet and a modal sheet
                ],
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return state.selectDriver
                    ? Positioned(
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
                      )
                    : 0.vGap;
              },
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                final data = getDriverData();
                return state.showDrivers
                    ? Positioned(
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
                                          ShowBookingDetailsEvent(
                                            showBookingDetails: true,
                                          ),
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
                      )
                    : 0.vGap;
              },
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return state.showBookingDetails
                    ? Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: WakaluxCard(
                          child: Column(
                            children: const [],
                          ),
                        ),
                      )
                    : 0.vGap;
              },
            ),
          ],
        ),
      ),
    );
  }

// function to handle modal buttom sheet
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/data/dummy.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/bloc/home_bloc.dart';
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
                            Icons.location_on,
                            color: context.scheme.error,
                          ),
                          trainling: Icon(
                            Icons.close,
                            color: context.scheme.onBackground,
                          ),
                          message: 'Destination Coordimates',
                          onTap: () {
                            BottomSheets.showSuggestedRidesModalSheet(
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
                        bottom: 0,
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
                    : const SizedBox.shrink();
              },
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return state.showDrivers
                    ? Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          height: 200,
                          width: context.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: context.scheme.background,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: context.width * 0.9,
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Expanded(
                                              child: ProfileImage(
                                                imageUrl:
                                                    'https://placeimg.com/640/480/any',
                                              ),
                                            ),
                                            5.hGap,
                                            Expanded(
                                              flex: 3,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Ayuko Peters',
                                                    style: context.titleLgBold,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: context
                                                            .scheme.secondary,
                                                        size: 20,
                                                      ),
                                                      5.hGap,
                                                      Text(
                                                        '4.0',
                                                        style: context.bodySm,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            5.hGap,
                                            Expanded(
                                              flex: 2,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 25,
                                                    backgroundColor: context
                                                        .scheme
                                                        .tertiaryContainer,
                                                    child: Icon(
                                                      Icons.chat,
                                                      color: context
                                                          .scheme.onBackground,
                                                    ),
                                                  ),
                                                  5.hGap,
                                                  CircleAvatar(
                                                    radius: 25,
                                                    backgroundColor: context
                                                        .scheme
                                                        .secondaryContainer,
                                                    child: Icon(
                                                      Icons.phone_outlined,
                                                      color: context
                                                          .scheme.onBackground,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        5.vGap,
                                        Divider(
                                          color: context.scheme.onBackground,
                                          // .withOpacity(0.6),
                                          thickness: 0.4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

// function to handle modal buttom sheet
}

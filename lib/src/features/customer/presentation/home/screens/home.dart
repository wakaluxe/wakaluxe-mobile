import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/data/dummy.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/custom_tile.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/bloc/home_bloc.dart';

// List<Map<String, dynamic>> data = []

@RoutePage(name: 'Home')
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scheme.onBackground,
      body: SafeArea(
        child: Padding(
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
                        _showSuggestedRidesModalSheet(
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
      ),
    );
  }

// function to handle modal buttom sheet
  Future<void> _showSuggestedRidesModalSheet(
    BuildContext context, {
    required List<Map<String, dynamic>> data,
  }) async {
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      isScrollControlled: true,
      builder: (_) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Wrap(
          // runSpacing: 10,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Suggested Rides', style: context.bodyLg),
                10.vGap,
                ...data.map(
                  (e) => BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      // will build custom list tile
                      return CustomTile(
                        onTap: () {
                          context.read<HomeBloc>().add(
                                SelectedRideEvent(
                                  selectedIndex: data.indexOf(e),
                                ),
                              );
                        },
                        data: e,
                        leading: const Icon(Icons.directions_car),
                        title: e['name'].toString(),
                        subtitle: e['type'].toString(),
                        trailing: Column(
                          children: [
                            8.vGap,
                            Text(
                              e['price'].toString(),
                              style: context.bodyMd,
                            ),
                            3.vGap,
                            Text(
                              e['availableTime'].toString(),
                              style: context.bodySm,
                            ),
                          ],
                        ),
                        isSelected: state.selectedIndex == data.indexOf(e),
                      );
                    },
                  ),
                ),
                Column(
                  children: [
                    8.vGap,
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WakaluxeButtonMedium(
                              text: 'E-payment',
                              action: () {
                                context.read<HomeBloc>().add(
                                      SelectPaymentTypeEvent(
                                        selectedPaymentType: 0,
                                      ),
                                    );
                              },
                              width: 0.42,
                              color: context.scheme.background,
                              textColor: context.scheme.onBackground,
                              isOutline: true,
                              isSelected: state.selectedPaymentType == 0,
                            ),
                            WakaluxeButtonMedium(
                              width: 0.42,
                              text: 'Cash',
                              action: () {
                                context.read<HomeBloc>().add(
                                      SelectPaymentTypeEvent(
                                        selectedPaymentType: 1,
                                      ),
                                    );
                              },
                              color: context.scheme.background,
                              textColor: context.scheme.onBackground,
                              isOutline: true,
                              isSelected: state.selectedPaymentType == 1,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                10.vGap,
                Divider(
                  color: context.scheme.onBackground.withOpacity(0.5),
                  thickness: 0.5,
                ),
                10.vGap,
                WakaluxeButton(
                  text: 'Book',
                  action: () {},
                  color: context.scheme.tertiary,
                  textColor: context.scheme.onTertiary,
                ),
                10.vGap
              ],
            ),
          ],
        ),
      ),
    );
  }
}

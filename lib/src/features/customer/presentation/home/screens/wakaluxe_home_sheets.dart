import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc.dart';

class WakaluxeBottomSheets {
  static Future<void> showSuggestedRidesModalSheet(
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
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Suggested Rides', style: context.bodyLg),
                10.vGap,
                ...data.map(
                  (e) => BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      // will build custom list tile
                      return WakaluxTile(
                        onTap: () {
                          context.read<HomeBloc>().add(
                                SelectedRideEvent(
                                  selectedIndex: data.indexOf(e),
                                ),
                              );
                        },
                        leading: Image.asset(
                          e['image'].toString(),
                          height: 50,
                          width: 50,
                        ),
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
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return WakaluxeButton(
                      text: 'Book',
                      action: () {
                        Navigator.pop(context);
                        showPaymentBottomSheet(context);
                      },
                      color: context.scheme.tertiary,
                      textColor: context.scheme.onTertiary,
                    );
                  },
                ),
                10.vGap
              ],
            ),
          ],
        ),
      ),
    );
  }

  // buttonsheet for payment options

  static Future<void> showPaymentBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      isScrollControlled: true,
      isDismissible: false,
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Wrap(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(
                      'Select Payment',
                      style: context.bodyLg,
                    ),
                    10.vGap,
                    WakaluxTile(
                      isSelected: state.selectedPaymentMethod == 0,
                      onTap: () {
                        context.read<HomeBloc>().add(
                              SelectPaymentMethodEvent(
                                selectedPaymentMethod: 0,
                              ),
                            );
                      },
                      title: 'MTN Mobile Money ',
                      leading: Image.asset(
                        'assets/images/mtn_money.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                    WakaluxTile(
                      isSelected: state.selectedPaymentMethod == 1,
                      onTap: () {
                        context.read<HomeBloc>().add(
                              SelectPaymentMethodEvent(
                                selectedPaymentMethod: 1,
                              ),
                            );
                      },
                      title: 'Orange Money',
                      leading: Image.asset(
                        'assets/images/orange_money.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                    WakaluxTile(
                      isSelected: state.selectedPaymentMethod == 2,
                      onTap: () {
                        context.read<HomeBloc>().add(
                              SelectPaymentMethodEvent(
                                selectedPaymentMethod: 2,
                              ),
                            );
                      },
                      title: 'Card Payment',
                      leading: Image.asset(
                        'assets/images/middle.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                    25.vGap,
                    WakaluxeButton(
                      text: 'Apply',
                      action: () {
                        Navigator.pop(context);
                        context.read<HomeBloc>().add(
                              SelectDriverEvent(selectDriver: true),
                            );
                      },
                    ),
                    10.vGap,
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  static Future<void> showConfirmDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Booking Successful',
                style: context.titleLg,
              ),
              15.vGap,
              Text(
                'Your booking has been confirmed.Driver will pickup you in 2mi',
                style: context.bodySm,
                textAlign: TextAlign.center,
              ),
              24.vGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (event, state) {
                      return WakaluxeButtonMedium(
                        text: 'Cancel',
                        action: () {
                          Navigator.pop(context);
                          context.read<HomeBloc>().add(
                                ShowBookingDetailsEvent(),
                              );
                        },
                        color: context.scheme.background,
                        width: 0.3,
                        textColor: context.scheme.error,
                      );
                    },
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (event, state) {
                      return WakaluxeButtonMedium(
                        text: 'Done',
                        action: () {
                          Navigator.pop(context);
                          context.read<HomeBloc>().add(
                                ShowBookingDetailsEvent(),
                              );
                        },
                        color: context.scheme.tertiary,
                        width: 0.3,
                        textColor: context.scheme.onTertiary,
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  static Future<void> showRemarkSheet(
    BuildContext context,
    VoidCallback action,
  ) async {
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Please selected a reason for cancellation',
                    style: context.titleMd.copyWith(fontSize: 17),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon:
                          Icon(Icons.close, color: context.scheme.onBackground),
                    ),
                  ),
                )
              ],
            ),
            CheckboxListTile(
              value: false,
              onChanged: (value) {},
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                'Waiting for a long time ',
                style: context.bodyLg,
              ),
            ),
            CheckboxListTile(
              value: false,
              onChanged: (value) {},
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                'Wrong Address',
                style: context.bodyLg,
              ),
            ),
            CheckboxListTile(
              value: false,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {},
              title: Text(
                'Price too High',
                style: context.bodyLg,
              ),
            ),
            CheckboxListTile(
              value: false,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {},
              title: Text(
                'Others',
                style: context.bodyLg,
              ),
            ),
            40.vGap,
            WakaluxeButton(
              text: 'Submit',
              action: action,
              color: context.scheme.onBackground.withOpacity(0.1),
              textColor: context.scheme.onBackground,
            )
          ],
        ),
      ),
    );
  }
}

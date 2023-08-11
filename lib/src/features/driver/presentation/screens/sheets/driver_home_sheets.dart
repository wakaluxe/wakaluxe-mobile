import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/driver/domain/cubit/driver_home_sheet/driver_home_sheet.dart';

class WakaluxeDriverButtomSheets {
  static Future<void> showPickUpPointSheet(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Pick up point',
              style: context.bodyLgGray,
            ),
            10.vGap,
            Text(
              '0.5 miles away',
              style: context.bodyMdBold,
            )
          ],
        ),
      ),
    );
  }

  static Future<void> showDriverDetailsSheet(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      isScrollControlled: true,
      builder: (_) {
        final cubit = HomeSheetCubit();
        return BlocBuilder<HomeSheetCubit, bool>(
          bloc: cubit,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const WakaluxePerson(
                    userImage: 'https://placeimg.com/640/480/any',
                  ),
                  10.vGap,
                  Divider(
                    color: context.colorScheme.onBackground,
                    thickness: 0.5,
                  ),
                  10.vGap,
                  if (!state)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Waiting for passenger to enter the total',
                          style: context.bodyMd,
                        ),
                        20.vGap,
                        Text(
                          '3mins | 50 meters away',
                          style: context.bodyMdBold,
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: context.colorScheme.error,
                          size: 22,
                        ),
                        10.hGap,
                        Column(
                          children: [
                            Text(
                              'Destinition',
                              style: context.bodyLg,
                            ),
                            5.vGap,
                            Text(
                              'Kigali, Rwanda',
                              style: context.bodyMd,
                            ),
                          ],
                        )
                      ],
                    ),
                  20.vGap,

                  // create button
                  WakaluxeButton(
                    text: 'Start Trip',
                    textColor: context.colorScheme.onTertiary,
                    action: () {
                      if (!state) {
                        cubit.onHomeSheetChanged(value: true);
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static Future<void> showTerminatedSheet(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const WakaluxePerson(
                userImage: 'https://placeimg.com/640/480/any',
              ),
              10.vGap,
              Divider(
                color: context.colorScheme.onBackground,
                thickness: 0.5,
              ),
              10.vGap,

              Text(
                'Reached Destination successfully',
                style: context.bodyMdBold,
              ),

              20.vGap,

              // create button
              WakaluxeButton(
                text: 'Trip Completed',
                textColor: context.colorScheme.onTertiary,
                action: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

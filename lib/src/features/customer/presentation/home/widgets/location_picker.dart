import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc/home_bloc.dart';

class WakaluxLocationPicker extends StatelessWidget {
  const WakaluxLocationPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SizedBox(
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
                    color: context.colorScheme.background,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'Driver reaching Destination in 5 mins',
                    textAlign: TextAlign.center,
                  ),
                )
              : WakaluxeLocationWidget(
                  leading: Icon(
                    Icons.person,
                    color: context.colorScheme.primary,
                  ),
                  message: 'Location Coordinates',
                  onTap: () {
                    debugPrint('Testing out');
                  },
                ),
        );
      },
    );
  }
}

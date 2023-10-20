import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'package:wakaluxe/src/common/Utils/logger.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc/home_bloc.dart';
import 'package:wakaluxe/src/router/wakaluxe_router.gr.dart';

class PayFareWidget extends StatelessWidget {
  const PayFareWidget({
    required List<WayPoint> waypoints,
    super.key,
  }) : _waypoints = waypoints;

  final List<WayPoint> _waypoints;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: WakaluxeButton(
          text: 'Pay fare',
          action: () async {
            logInfo('pay fare: $_waypoints ');

            context.showSnackBar(
              'Will still to move to payment screen',
            );
            await Future<void>.delayed(const Duration(seconds: 2))
                .then(
                  (value) => context.read<HomeBloc>().add(
                        HomeInitialEvent(),
                      ),
                )
                .then(
                  (value) => context.router.pushAndPopUntil(
                    const PaymentMethodsRoute(),
                    predicate: (_) => false,
                  ),
                );
          },
          color: context.colorScheme.primary,
          // textColor: context.colorScheme.onTertoniary,
        ),
      ),
    );
  }
}

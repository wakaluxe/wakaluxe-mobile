import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc/home_bloc.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/screens/wakaluxe_home_sheets.dart';

class ShowBookingDetailsWidget extends StatelessWidget {
  const ShowBookingDetailsWidget({
    required this.tourId,
    super.key,
  });
  final String tourId;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: WakaluxCard(
        child: WakaluxeCancleRide(
          driverImage: 'https://i.pravatar.cc/480',
          driverName: 'Ayuko Peters',
          dropOffLocation: 'Avenue des banques',
          paymentAmount: '500',
          paymentMethod: 'MTN Mobile Money',
          pickUpLocation: 'Dispensaire Messasi',
          rating: 4.0,
          timeLeft: 5,
          action: () {
            context.read<HomeBloc>().add(
                  CancelTripEvent(
                    tourId,
                  ),
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
    );
  }
}

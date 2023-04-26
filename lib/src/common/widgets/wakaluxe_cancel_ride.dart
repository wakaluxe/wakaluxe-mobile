// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class WakaluxeCancleRide extends StatelessWidget {
  const WakaluxeCancleRide({
    required this.timeLeft,
    required this.driverName,
    required this.driverImage,
    required this.rating,
    required this.pickUpLocation,
    required this.dropOffLocation,
    required this.paymentMethod,
    required this.paymentAmount,
    required this.action,
    super.key,
  });
  final num timeLeft;
  final String driverName;
  final String driverImage;
  final num rating;
  final String pickUpLocation;
  final String dropOffLocation;
  final String paymentMethod;
  final String paymentAmount;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ariving in $timeLeft mins',
                style: context.bodyLgBold,
              ),
              Text(
                'Driver Details',
                style: context.bodyLgBold,
              ),
            ],
          ),
          10.vGap,
          Divider(
            color: context.scheme.onBackground,
            // .withOpacity(0.6),
            thickness: 0.4,
          ),
          10.vGap,
          WakaluxeDriver(
            driverImage: driverImage,
            driverName: driverName,
            rating: rating,
          ),
          10.vGap,
          Divider(
            color: context.scheme.onBackground,
            thickness: 0.4,
          ),
          10.vGap,
          Text('Your Trip', style: context.bodyLgBold),
          WakaluxeTripDetails(
            pickUpLocation: pickUpLocation,
            dropOffLocation: dropOffLocation,
          ),
          10.vGap,
          Divider(
            color: context.scheme.onBackground,
            // .withOpacity(0.6),
            thickness: 0.4,
          ),
          10.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Payment', style: context.bodyLgBold),
              Text('change', style: context.bodyLgBold),
            ],
          ),
          10.vGap,
          Row(
            children: [
              Icon(
                Icons.credit_card,
                color: context.scheme.onBackground,
              ),
              10.hGap,
              Text(
                paymentMethod,
                style: context.bodyMdBold,
              ),
              const Spacer(),
              Text(
                '$paymentAmount XAF',
                style: context.bodyMdBold,
              )
            ],
          ),
          25.vGap,
          WakaluxeButton(
            text: 'Cancel Ride',
            color: context.scheme.errorContainer,
            textColor: context.scheme.error,
            action: action,
          )
        ],
      ),
    );
  }
}
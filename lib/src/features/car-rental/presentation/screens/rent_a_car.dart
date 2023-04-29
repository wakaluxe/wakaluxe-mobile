import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage(name: 'RentACar')
class RentACar extends StatelessWidget {
  const RentACar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                WakaluxeCarRental(
                  brand: 'SUZUKI',
                  garageClick: () {},
                  imageUrl: 'assets/images/Luxurious.png',
                  name: 'VITARA',
                ),
                20.vGap,
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: context.scheme.onBackground.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Available Cars',
                            style: context.displaySm.copyWith(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: context.scheme.onBackground,
                            size: 20,
                          )
                        ],
                      ),
                      10.vGap,
                      Text(
                        'Long tern, Short term',
                        style: context.bodyLg,
                      ),
                      15.vGap
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: context.scheme.onPrimary,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: context.scheme.onBackground.withOpacity(0.5),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.menu,
                      color: context.scheme.onBackground,
                    ),
                  ),
                  const WakaluxeProfileImage(
                    imageUrl: 'https://placeimg.com/640/480/any',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

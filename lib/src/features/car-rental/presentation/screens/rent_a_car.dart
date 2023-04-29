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
      backgroundColor: context.scheme.background,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WakaluxeCarRental(
                    brand: 'MERCEDES',
                    garageClick: () {},
                    imageUrl: 'assets/images/Luxurious.png',
                    name: 'AMG',
                  ),
                  
                  20.vGap,
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: context.scheme.tertiary,
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
                          15.vGap,
                        ],
                      ),
                    ),
                  ),
                  30.vGap,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Choose by category',
                      style: context.displaySm.copyWith(
                        fontSize: 23,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  10.vGap,
                  SizedBox(
                    height: context.height * 0.25,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => WakaluxCard(
                        width: context.width * 0.38,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Luxurious.png'),
                            5.vGap,
                            Text(
                              'Premium',
                              style: context.bodyLgBold,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  20.vGap,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Top Deals',
                      style: context.displaySm.copyWith(
                        fontSize: 23,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  10.vGap,
                  SizedBox(
                    height: context.height * 0.25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) => WakaluxCard(
                        width: context.width * 0.42,
                        child: const WakaluxeDealCard(
                          imageUrl:
                              'assets/images/Audi-Red-Car-Transparent.png',
                          name: 'Audi R8',
                          price: '600,000',
                          tag: 'Weekly',
                        ),
                      ),
                    ),
                  )
                ],
              ),
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

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage(name: 'ViewCar')
class ViewCar extends StatelessWidget {
  const ViewCar({super.key});

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
                    name: 'AMG 15',
                    brand: 'Mercedes Benz',
                    imageUrl: 'assets/images/Luxurious.png',
                    garageClick: () {},
                    showGarage: false,
                  ),
                  20.vGap,
                  SizedBox(
                    height: context.height * 0.1,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const WakaluxeOptionCard(
                        duration: '1 Year',
                        price: '12,000,000',
                        isSelected: true,
                      ),
                    ),
                  ),
                  20.vGap,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'SPECIFICATIONS',
                        style: context.titleLg.copyWith(
                          color: context.scheme.onBackground.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child:
                  SizedBox(
                    height: context.height * 0.12,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => WakaluxCard(
                        width: context.width * 0.34,
                        child: const WakaluxePropertyCard(
                          propertyName: 'Color',
                          propertyValue: 'White',
                        ),
                      ),
                    ),
                  ),
                  20.vGap,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Pick-up location',
                        style: context.bodyMd.copyWith(
                          color: context.scheme.onBackground.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
                  5.vGap,
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: context.width,
                    height: context.height * .2,
                    decoration: BoxDecoration(
                      color: context.scheme.onBackground.withOpacity(.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: const Text('Will place map here when provided'),
                  ),
                  30.vGap,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: WakaluxeButton(
                      text: 'Rent Car',
                      textColor: context.scheme.onTertiary,
                    ),
                  ),
                  20.vGap,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '6 Months',
                      style: context.bodyMd,
                    ),
                  ),
                  10.vGap,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          '600,000 XAF',
                          style: context.titleLg,
                        ),
                        5.hGap,
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Per month',
                            style: context.bodyMd.copyWith(
                              color:
                                  context.scheme.onBackground.withOpacity(0.6),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  10.vGap
                  // )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 20),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: context.scheme.background,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  context.router.pop();
                },
                child: Icon(
                  Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                  size: 30,
                  color: context.scheme.onBackground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage(name: 'ViewInGarage')
class ViewInGarage extends StatelessWidget {
  const ViewInGarage({@PathParam('carId') required this.car, super.key});

  final String car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    imageUrl: 'assets/images/luxurious.png',
                    garageClick: () {},
                    showGarage: false,
                  ),
                  20.vGap,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: context.height * 0.11,
                        child: const WakaluxeOptionCard(
                          duration: ' Year',
                          price: '300,000',
                          isSelected: true,
                        ),
                      ),
                      15.hGap,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          WakaluxeTextProperty(
                            title: 'Time Left:',
                            value: '2weeks & 4 days',
                          ),
                          WakaluxeTextProperty(
                            title: 'Start Date:',
                            value: '2nd March 2023',
                          ),
                          WakaluxeTextProperty(
                            title: 'End Date:',
                            value: '2nd April 2023',
                          ),
                        ],
                      )
                    ],
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
                  GestureDetector(
                    onTap: () {
                      context.router.pushNamed('/status_report/testname');
                    },
                    child: Container(
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
                  ),
                  5.vGap,
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

class WakaluxeTextProperty extends StatelessWidget {
  const WakaluxeTextProperty({
    required this.title,
    required this.value,
    super.key,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: context.bodyLgGray,
        ),
        5.hGap,
        Text(
          value,
          style: context.bodyMdBold,
        )
      ],
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage(name: 'DriverHome')
class DriverHome extends StatelessWidget {
  const DriverHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scheme.onBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      //  remove and replace with hamburger icon
                      GestureDetector(
                        onTap: () {
                          context.router.pushNamed('/rent-a-car');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: context.scheme.background,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.menu,
                            color: context.scheme.onBackground,
                          ),
                        ),
                      ),
                      20.hGap,
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: context.scheme.background,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Total earned today',
                                  style: context.bodySm,
                                ),
                                5.vGap,
                                Text(
                                  '30,000XAF',
                                  style: context.bodyMdBold,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      20.hGap,
                      WakaluxeProfileImage(
                        onTap: () {
                          context.router.pushNamed('/driver_login');
                        },
                        imageUrl: 'https://placeimg.com/640/480/any',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: const [
                    WakaluxeRoundedButton(
                      text: 'GO',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

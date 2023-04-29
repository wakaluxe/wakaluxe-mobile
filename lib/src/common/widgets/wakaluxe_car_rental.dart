import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class WakaluxeCarRental extends StatelessWidget {
  const WakaluxeCarRental({
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.garageClick,
    this.showGarage = true,
    super.key,
    this.asset,
  });
  final String name;
  final String brand;
  final String imageUrl;
  final bool? asset;
  final VoidCallback garageClick;
  final bool showGarage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.scheme.background,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: context.scheme.onBackground.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      height: context.height * 0.4,
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.vGap,
          Align(
            child: Image.asset(imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.displaySm.copyWith(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                5.vGap,
                Row(
                  children: [
                    Text(
                      brand,
                      style: context.bodyLg.copyWith(fontSize: 18),
                    ),
                    const Spacer(),
                    if (showGarage)
                      InkWell(
                        onTap: garageClick,
                        child: Row(
                          children: [
                            Text(
                              'My Garage',
                              style: context.bodyMdBold,
                            ),
                            5.hGap,
                            Icon(
                              Icons.arrow_forward_ios,
                              color: context.scheme.onBackground,
                              size: 15,
                            ),
                          ],
                        ),
                      )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

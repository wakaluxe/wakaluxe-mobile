// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';

import 'package:wakaluxe/src/common/Utils/wakalux_icons_icons.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({
    required this.imageLiknks,
    required this.driverName,
    required this.driverImage,
    required this.rating,
    required this.recommended,
    required this.time,
    required this.distance,
    required this.price,
    required this.action,
    super.key,
  });
  final List<String> imageLiknks;
  final String driverName;
  final String driverImage;
  final num rating;
  final int recommended;
  final String time;
  final String distance;
  final String price;
  final VoidCallback action;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.scheme.background,
          borderRadius: BorderRadius.circular(20),
          //add box shadow

          boxShadow: [
            BoxShadow(
              color: context.scheme.onBackground.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(
                0,
                3,
              ), // changes position of shadow
            ),
          ],
        ),
        width: context.width * 0.9,
        margin: const EdgeInsets.only(left: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ProfileImage(
                        imageUrl: driverImage,
                      ),
                    ),
                    5.hGap,
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            driverName,
                            style: context.titleLgBold,
                          ),
                          Row(
                            children: [
                              Icon(
                                WakaluxIcons.star,
                                color: context.scheme.tertiary,
                                size: 20,
                              ),
                              5.hGap,
                              Text(
                                rating.toString(),
                                style: context.bodySm,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    5.hGap,
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: context.scheme.tertiaryContainer,
                            child: Icon(
                              WakaluxIcons.message_outlined,
                              color: context.scheme.onBackground,
                            ),
                          ),
                          5.hGap,
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: context.scheme.secondaryContainer,
                            child: Icon(
                              WakaluxIcons.phone,
                              color: context.scheme.onBackground,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              5.vGap,
              Divider(
                color: context.scheme.onBackground,
                // .withOpacity(0.6),
                thickness: 0.4,
              ),
              5.vGap,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Row(
                  children: [
                    FlutterImageStack(
                      imageList: imageLiknks,
                      totalCount: 4,
                      itemRadius: 40,
                      showTotalCount: false,
                    ),
                    10.hGap,
                    Text('$recommended Recommended'),
                  ],
                ),
              ),
              5.vGap,
              Divider(
                color: context.scheme.onBackground,
                // .withOpacity(0.6),
                thickness: 0.4,
              ),
              5.vGap,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.directions_car,
                      color: context.scheme.onBackground,
                      size: 50,
                    ),
                    10.hGap,
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'DISTANCE',
                            style: context.bodySm,
                          ),
                          5.vGap,
                          Text(
                            '$distance Km',
                            style: context.bodySm,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'TIME',
                            style: context.bodySm,
                          ),
                          5.vGap,
                          Text(
                            '$time Km',
                            style: context.bodySm,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'PRICE',
                            style: context.bodySm,
                          ),
                          5.vGap,
                          Text(
                            '$price XAF',
                            style: context.bodySm,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              20.vGap,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: WakaluxeButton(
                  text: 'Confirm',
                  action: action,
                  color: context.scheme.tertiary,
                  textColor: context.scheme.onTertiary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

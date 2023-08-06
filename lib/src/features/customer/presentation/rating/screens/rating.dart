import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wakaluxe/src/common/Utils/wakalux_icons_icons.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakaluxe_text_area.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage(name: 'Rating')
class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Align(
          child: Column(
            children: [
              SizedBox(
                width: context.width * 0.6,
                child: Text(
                  'Thank you for choosing my service',
                  style: context.titleLgBold,
                  textAlign: TextAlign.center,
                ),
              ),
              10.vGap,
              const WakaluxeProfileImage(
                imageUrl: 'https://placeimg.com/640/480/any',
                size: 50,
              ),
              20.vGap,
              SizedBox(
                width: context.width * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var i = 0; i < 5; i++)
                      const Icon(
                        WakaluxIcons.star,
                        color: Colors.yellow,
                        size: 25,
                      ),
                  ],
                ),
              ),
              20.vGap,
              // create text area
              const SizedBox(
                child: WakaluxeTextArea(
                  hintText: 'Enter test here...',
                ),
              ),
              const Spacer(),
              WakaluxeButton(
                text: 'Done',
                textColor: context.scheme.onTertiary,
                action: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

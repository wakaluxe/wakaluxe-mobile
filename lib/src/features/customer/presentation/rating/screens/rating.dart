import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wakaluxe/src/common/Utils/alerts.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakaluxe_text_area.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/router/wakaluxe_router.gr.dart';

@RoutePage(name: 'Rating')
class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
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
                imageUrl: 'https://i.pravatar.cc/640/any',
                size: 50,
              ),
              20.vGap,
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                maxRating: 5,
                allowHalfRating: true,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: print,
              ),
              20.vGap,
              // create text area
              const SizedBox(
                child: WakaluxeTextArea(
                  hintText: 'How was your ride?',
                ),
              ),
              const Spacer(),
              WakaluxeButton(
                text: 'Done',
                textColor: context.colorScheme.onTertiary,
                action: () => _handleRating(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleRating(BuildContext context) {
    successToast(context, 'Ride completed');
    context.router.pushAndPopUntil(const Home_2(), predicate: (_) => false);
  }
}

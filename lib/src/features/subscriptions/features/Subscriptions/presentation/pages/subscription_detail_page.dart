// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/l10n/l10n.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/screens/home_map.dart';
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/widgets/padded_body.dart';
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/widgets/subscriptions_amount.dart';

@RoutePage(
  name: 'SubscriptionDetail',
)
class WakaluxeSubscriptionDetail extends StatelessWidget {
  const WakaluxeSubscriptionDetail({
    @PathParam('plan') required this.plan,
    super.key,
  });

  final String plan;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      body: PaddedBody(
        body: Padding(
          padding: EdgeInsets.only(
            top: 42.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const WakaluxBackhButton(),
              30.vGap,
              Text(
                '$plan Plan',
                style: text.headline,
              ),
              5.vGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${subscription_amount(plan)}/',
                          style: text.title,
                        ),
                        TextSpan(
                            text: AppLocalizations.of(context).month,
                            style: text.body2),
                      ],
                    ),
                  ),
                ],
              ),
              30.vGap,
              Text(
                AppLocalizations.of(context).description,
                style: text.subHeading1,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: _mockSubscriptions(context).length,
                  separatorBuilder: (BuildContext context, int index) =>
                      20.vGap,
                  itemBuilder: (BuildContext context, int index) {
                    final item = _mockSubscriptions(context)[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '\u2022',
                          style: TextStyle(fontSize: 30),
                        ),
                        10.hGap,
                        SizedBox(
                          width: 321.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                item['title']!,
                                style: text.body2,
                              ),
                              // 5.vGap,
                              Text(
                                item['content']!,
                                style: text.body1,
                                maxLines: 8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const Spacer(),
              WakaluxeButton(
                action: () => context.router.pushNamed(HomeMap.path),
                text: AppLocalizations.of(context).subscribe,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, String>> _mockSubscriptions(BuildContext context) => [
      {
        'title': AppLocalizations.of(context).subscriptionPlanFeature1,
        'content':
            AppLocalizations.of(context).subscriptionPlanFeature1Description,
      },
      {
        'title': AppLocalizations.of(context).subscriptionPlanFeature2,
        'content': AppLocalizations.of(context).subscriptionPlanFeature2Description,
      },
    ];

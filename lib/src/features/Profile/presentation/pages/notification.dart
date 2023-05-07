// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:wakaluxe/src/common/widgets/wakalux_back_button.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/features/Profile/presentation/widgets/empty_notification_content.dart';

@RoutePage(name: 'Notification')
class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  bool isManage = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: const WakaluxBackButton(),
        title: Text(
          'Notifications',
          style: theme.title,
        ),
        actions: [
          Visibility(
            visible: !isManage && notifications.isNotEmpty,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isManage = true;
                });
              },
              child: SvgPicture.asset(Constants.editSquareIcon),
            ),
          ),
          Visibility(
            visible: isManage,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isManage = false;
                });
              },
              child: Text('Done', style: theme.button1),
            ),
          ),
        ],
      ),
      body: notifications.isEmpty
          ? const EmptyNotificationContent()
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0.w,
                  vertical: 30.h,
                ),
                child: Column(
                  children: [
                    // const SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return ListTile(
                          leading: isManage
                              ? Checkbox(value: false, onChanged: (val) {})
                              : CircleAvatar(
                                  radius: 5.r,
                                  backgroundColor: context.scheme.primary,
                                ),
                          title: Text(
                            notification['name'] as String,
                            style: theme.titleMedium,
                          ),
                          subtitle: Text(
                            notification['content'] as String,
                            style: theme.bodyLarge,
                          ),
                          trailing: Text(
                            notification['time'] as String,
                            style: theme.bodyLarge,
                          ),
                        );
                      },
                    ),
                    // const Spacer(),
                    Visibility(
                      visible: isManage,
                      child: Row(
                        children: [
                          NotificationButton(
                            title: 'Mark all as read',
                            color: context.scheme.inversePrimary,
                            onPressed: () {},
                          ),
                          const Spacer(),
                          NotificationButton(
                            title: 'Clear all',
                            color: context.scheme.primary,
                            onPressed: () {
                              setState(() {
                                notifications.clear();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
    required this.title,
    required this.color,
    this.onPressed,
  });

  final String title;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 177.w,
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 17.w),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          title,
          style: theme.button1,
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> notifications = [
  {
    'name': 'Message from John',
    'content': 'Hey, are you free to meet up tomorrow?',
    'time': '3 hours ago',
    'isRead': true
  },
  {
    'name': 'New follower',
    'content': 'You have a new follower on Instagram!',
    'time': '4 hours ago',
    'isRead': true
  },
  {
    'name': 'Reminder',
    'content': 'Pay your credit card bill by the end of the day',
    'time': '5 hours ago',
    'isRead': true
  },
  {
    'name': 'Discount code',
    'content': 'Get 20% off your next purchase with this code',
    'time': '10 hours ago',
    'isRead': false
  },
  {
    'name': 'Package delivery',
    'content': 'Your package has been delivered to your doorstep',
    'time': '1 day ago',
    'isRead': false
  },
  {
    'name': 'Meeting reminder',
    'content': "Don't forget about our meeting at 2pm today",
    'time': '2 days ago',
    'isRead': true
  },
  {
    'name': 'News update',
    'content': 'Breaking news: New COVID-19 variant detected',
    'time': '1 week ago',
    'isRead': false
  }
];

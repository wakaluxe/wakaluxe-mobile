import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/Communication/presentation/widgets/wakalux_badge.dart';

import 'package:wakaluxe/src/features/Communication/presentation/widgets/messages_content.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.router.pop(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Inbox',
          style: theme.title,
        ),
        actions: [
          SvgPicture.asset(Constants.moreSquareIcon),
          23.hGap,
        ],
      ),
      body: SizedBox(
        width: context.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                indicatorColor: context.scheme.primary,
                labelStyle: theme.subHeading1,
                unselectedLabelStyle: theme.subHeading1.copyWith(
                  color: context.scheme.outlineVariant,
                ),
                tabs: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Tab(
                        text: 'Chats',
                      ),
                      15.hGap,
                      const WakaluxBadge(value: '3')
                    ],
                  ),
                  const Tab(
                    text: 'Calls',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    MessagesContent(),
                    Center(
                      child: Text('No Calls'),
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/Communication/presentation/widgets/chat_view.dart';
import 'package:wakaluxe/src/features/Communication/presentation/widgets/message_input.dart';

@RoutePage()
class Message extends StatefulWidget {
  const Message({
    @PathParam('id') required this.id,
    super.key,
  });
  final String id;

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: const Hero(
            tag: 'chat',
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/chat.png'),
            ),
          ),
          title: Text(
            'John Doe',
            style: Theme.of(context).textTheme.body2,
          ),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(Constants.starIcon, height: 20.h, width: 20.w),
              6.hGap,
              Text(
                '4.5',
                style: Theme.of(context).textTheme.button1,
              ),
            ],
          ),
          trailing: CircleAvatar(
            radius: 15,
            backgroundColor: context.colorScheme.tertiary,
            child: SvgPicture.asset(
              Constants.callIcon,
              height: 17.h,
              width: 17.w,
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: context.width,
        child: const Column(
          children: <Widget>[
            ChatView(),
            MessageInput(),
          ],
        ),
      ),
    );
  }
}

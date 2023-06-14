// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/Communication/presentation/widgets/chat_view.dart';
import 'package:wakaluxe/src/features/Communication/presentation/widgets/message_input.dart';

<<<<<<< HEAD
@RoutePage(name: 'Message')
=======
@RoutePage()    
>>>>>>> 5c430bba86ac8f925b88c0faa991c8679432bf5b
class Message extends StatefulWidget {
  const Message({
    super.key,
    @PathParam('id') required this.id,
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
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
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
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(Constants.starIcon),
              6.hGap,
              Text(
                '4.5',
                style: Theme.of(context).textTheme.button1,
              ),
            ],
          ),
          trailing: CircleAvatar(
            radius: 20,
            backgroundColor: context.scheme.tertiary,
            child: SvgPicture.asset(Constants.callIcon),
          ),
        ),
      ),
      body: SizedBox(
        width: context.width,
        child: Column(
          children: const <Widget>[
            ChatView(),
            MessageInput(),
          ],
        ),
      ),
    );
  }
}

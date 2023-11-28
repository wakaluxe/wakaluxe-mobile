import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:wakaluxe/src/features/Communication/presentation/widgets/message_input.dart';

@RoutePage()
class TripMessageView extends StatelessWidget {
  const TripMessageView({required this.channel, super.key});
  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return StreamChannel(
      channel: channel,
      child: const Scaffold(
        appBar: StreamChannelHeader(),
        body: Column(
          children: <Widget>[
            Expanded(
              child: StreamMessageListView(),
            ),
            StreamMessageInput(),
          ],
        ),
      ),
    );
  }
}

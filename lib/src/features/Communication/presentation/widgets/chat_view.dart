import 'package:flutter/material.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final List<Map<String, String>> messages = [
    {'sender': 'user', 'text': 'Hi there!'},
    {'sender': 'receiver', 'text': 'Hello.'},
    {'sender': 'receiver', 'text': 'How are you doing?'},
    {'sender': 'user', 'text': 'I am good, thanks. How about you?'},
    {'sender': 'receiver', 'text': 'I am doing great!'},
    {'sender': 'receiver', 'text': 'That sounds awesome!'}
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          final message = messages[index];
          return Align(
            alignment: message['sender'] == 'user'
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: context.scheme.tertiary,
                
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                message['text']!,
                style: Theme.of(context).textTheme.button1,
              ),
            ),
          );
        },
      ),
    );
  }
}

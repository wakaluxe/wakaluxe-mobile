import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SelectPayment extends StatelessWidget {
  const SelectPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: const Center(
        child: Text('SelectPayment'),
      ),
    );
  }
}

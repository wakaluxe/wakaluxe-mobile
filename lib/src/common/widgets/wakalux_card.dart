// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:wakaluxe/src/extensions/build_context.dart';

class WakaluxCard extends StatelessWidget {
  const WakaluxCard({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.scheme.background,
          borderRadius: BorderRadius.circular(20),
          //add box shadow
          boxShadow: [
            BoxShadow(
              color: context.scheme.onBackground.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(
                0,
                3,
              ), // changes position of shadow
            ),
          ],
        ),
        width: context.width * 0.9,
        margin: const EdgeInsets.only(left: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: child,
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:wakaluxe/src/extensions/build_context.dart';

class WakaluxCard extends StatelessWidget {
  const WakaluxCard({
    required this.child,
    this.width,
    super.key,
  });
  final Widget child;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: width == null ? 10 : 2,
        left: width == null ? 10 : 2,
        top: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.scheme.background,
          borderRadius: BorderRadius.circular(20),
          //add box shadow
          boxShadow: [
            BoxShadow(
              color: context.scheme.onBackground.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(
                0,
                2,
              ), // changes position of shadow
            ),
          ],
        ),
        width: width ?? context.width * 0.9,
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

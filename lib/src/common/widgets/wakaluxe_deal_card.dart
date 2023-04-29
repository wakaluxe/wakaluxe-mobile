import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class WakaluxeDealCard extends StatelessWidget {
  const WakaluxeDealCard({
    required this.tag,
    required this.imageUrl,
    required this.name,
    required this.price,
    super.key,
  });

  final String tag;
  final String imageUrl;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: context.scheme.tertiary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(tag),
            ),
          ),
          10.vGap,
          Image.asset(
            imageUrl,
          ),
          20.vGap,
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: context.titleMd,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '$price XAF',
              style: context.titleMdBold,
            ),
          )
        ],
      ),
    );
  }
}

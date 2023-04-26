import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class WakaluxeProfileImage extends StatelessWidget {
  const WakaluxeProfileImage({
    required this.imageUrl,
    super.key,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.white,
      child: ClipPath(
        clipper: const ShapeBorderClipper(
          shape: CircleBorder(),
        ),
        child: ColoredBox(
          color: context.scheme.primary,
          child: Image.network(
            imageUrl,
          ),
        ),
      ),
    );
  }
}

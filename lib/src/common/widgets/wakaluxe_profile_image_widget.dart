import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class WakaluxeProfileImage extends StatelessWidget {
  const WakaluxeProfileImage({
    required this.imageUrl,
    this.size,

    super.key,
  });
  final String imageUrl;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size ?? 25,
      backgroundColor: Colors.white,
      child: ClipPath(
        clipper: const ShapeBorderClipper(
          shape: CircleBorder(),
        ),
        child: ColoredBox(
          color: context.scheme.primary,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

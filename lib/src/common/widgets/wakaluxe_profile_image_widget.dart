import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class WakaluxeProfileImage extends StatelessWidget {
  const WakaluxeProfileImage({
    required this.imageUrl,
    this.size,
    super.key,
    this.onTap,
  });
  final String imageUrl;
  final double? size;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: context.scheme.onBackground.withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: CircleAvatar(
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
        ),
      ),
    );
  }
}

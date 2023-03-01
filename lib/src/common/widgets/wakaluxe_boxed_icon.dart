import 'package:flutter/material.dart';
import 'package:wakaluxe/src/configs/configs.dart';

class WakaluxeBoxedIcon extends StatelessWidget {
  const WakaluxeBoxedIcon({
    required this.icon,
    this.color = Palette.primary,
    super.key,
    this.action,
  });
  final VoidCallback? action;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Icon(
              icon,
            ),
          ),
        ),
      ),
    );
  }
}

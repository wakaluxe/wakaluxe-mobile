import 'package:flutter/material.dart';

class WakaluxeDottedLine extends CustomPainter {
  WakaluxeDottedLine({required this.color});

  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    const dashHeight = 5.0;
    const dashSpace = 4.0;

    var startY = 0.0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.width;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

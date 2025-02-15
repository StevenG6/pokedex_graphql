import 'package:flutter/material.dart';

/// Paints a grid of evenly spaced dots as the background.
class BackgroundPainter extends CustomPainter {
  static const double _dotSpacing = 25;
  static const double _dotRadius = 1;
  static const Color _dotColor = Colors.black38;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = _dotColor;

    for (double dx = _dotSpacing / 2; dx < size.width; dx += _dotSpacing) {
      for (double dy = 1; dy < size.height; dy += _dotSpacing) {
        canvas.drawCircle(Offset(dx, dy), _dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

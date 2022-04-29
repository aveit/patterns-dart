import 'package:flutter/material.dart';
import 'package:strategy/strategies/painter_strategy.dart';

class CirclesPainter implements PainterStrategy {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    for (double _current = 0; _current < 1; _current += .1) {
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        150 * _current,
        paint,
      );
    }
  }
}

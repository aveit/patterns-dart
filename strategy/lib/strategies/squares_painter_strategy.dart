import 'package:flutter/material.dart';
import 'package:strategy/strategies/painter_strategy.dart';

class SquaresPainter implements PainterStrategy {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    for (double _current = 0; _current < .5; _current += .1) {
      canvas.drawRect(
        Rect.fromPoints(
          Offset(size.width * _current, size.height * _current),
          Offset(size.width * (1 - _current), size.height * (1 - _current)),
        ),
        paint,
      );
    }
  }
}

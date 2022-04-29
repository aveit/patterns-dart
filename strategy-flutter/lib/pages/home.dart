import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:strategy/strategies/circles_painter_strategy.dart';
import 'package:strategy/strategies/painter_strategy.dart';
import 'package:strategy/strategies/squares_painter_strategy.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentNumber;
  PainterStrategy _currentStrategy = SquaresPainter();

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _currentNumber = Random().nextInt(100);
        if (_currentNumber.isEven) {
          _currentStrategy = CirclesPainter();
        } else {
          _currentStrategy = SquaresPainter();
        }
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Strategy pattern'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Desenhando na tela, mas não sei qual estratégia será utilizada',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CustomPaint(
                  painter: StrategyPainter(strategy: _currentStrategy),
                  child: Container(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StrategyPainter extends CustomPainter {
  final PainterStrategy strategy;

  StrategyPainter({required this.strategy});

  @override
  void paint(Canvas canvas, Size size) {
    strategy.paint(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

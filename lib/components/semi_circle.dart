import 'dart:math' as math;

import 'package:flutter/material.dart';

class SemiCircle extends StatelessWidget {
  final double diameter;
  final Color color;

  const SemiCircle({Key key, this.diameter = 200, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(color: color),
      size: Size(diameter, diameter),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  final Color color;
  MyPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

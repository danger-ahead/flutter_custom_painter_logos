import 'package:flutter/material.dart';
import 'dart:math' as math;

class LG extends StatelessWidget {
  const LG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: Logo(),
      size: const Size(150.0, 150.0),
    );
  }
}

class Logo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final red = Paint()..color = const Color(0xFF990033);
    final whiteFilled = Paint()..color = Colors.white;
    final white = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;

    //the circle
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 125, red);

    //the G and L in the logo
    final path = Path()
      ..moveTo((size.width / 1.25), (size.height / 2))
      ..arcTo(
          Offset((size.width / 2 - 100), (size.height / 2 - 100)) &
              const Size(200, 200),
          0,
          math.pi * 1.5,
          true)
      ..moveTo(size.width / 2 + 106, size.height / 2)
      ..lineTo(size.width / 2 + 30, size.height / 2)
      ..moveTo(size.width / 2, size.height / 2 - 50)
      ..lineTo(size.width / 2, size.height / 2 + 50)
      ..moveTo(size.width / 2 - 6, size.height / 2 + 50)
      ..lineTo(size.width / 2 + 25, size.height / 2 + 50)
      ..close();
    canvas.drawPath(path, white);

    //the white circle in the logo
    final circle = Path()
      ..arcTo(
          Offset(size.width / 2 - 60, size.height / 2 - 45) &
              const Size(30, 30),
          0,
          math.pi * 1.9999999,
          true)
      ..close();
    canvas.drawPath(circle, whiteFilled);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

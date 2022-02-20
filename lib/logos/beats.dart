import 'package:flutter/material.dart';

class Beats extends StatelessWidget {
  const Beats({Key? key}) : super(key: key);

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
    final red = Paint()
      ..color = const Color(0xFFE01F3D)
      ..style = PaintingStyle.fill;

    final white = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 34.0;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 150, red);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 65, white);
    canvas.drawLine(Offset(size.width / 2 - 65, size.height / 2),
        Offset(size.width / 2 - 65, size.height / 2 - 150), white);
  }

  @override
  bool shouldRepaint(Logo oldDelegate) => false;
}

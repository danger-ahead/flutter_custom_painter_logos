import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: MyArc(),
        ),
      ),
    );
  }
}

class MyArc extends StatelessWidget {
  const MyArc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //for responsive design
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 1000) {
        return const Logo(
          diameter: 150,
          isMobile: true,
        );
      }
      return const Logo(
        diameter: 200,
        isMobile: false,
      );
    });
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    required this.diameter,
    required this.isMobile,
  }) : super(key: key);

  final double diameter;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPaint(
          painter: Left(isMobile),
          size: Size(diameter, diameter),
        ),
        Padding(
          padding: EdgeInsets.only(left: isMobile ? 25.0 : 30.0),
          child: CustomPaint(
            painter: Right(isMobile),
            size: Size(diameter, diameter),
          ),
        ),
      ],
    );
  }
}

class Left extends CustomPainter {
  final bool isMobile;
  Left(this.isMobile);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF009900)
      ..style = PaintingStyle.stroke
      ..strokeWidth = isMobile ? 28 : 32;
    canvas.drawLine(Offset(isMobile ? -13.6 : -15.5, size.height / 2),
        Offset(size.width, size.height / 2), paint);
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi / 2,
      math.pi / 2,
      false,
      paint,
    );
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      -math.pi / 1.25,
      math.pi * 1.5,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Right extends CustomPainter {
  final bool isMobile;
  Right(this.isMobile);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF009900)
      ..style = PaintingStyle.stroke
      ..strokeWidth = isMobile ? 28 : 32;
    canvas.drawLine(
        Offset(
            isMobile ? size.width + 13.6 : size.width + 15.5, size.height / 2),
        Offset(0, size.height / 2),
        paint);
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi / 1.25,
      math.pi,
      false,
      paint,
    );
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      0,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

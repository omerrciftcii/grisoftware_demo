import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path1 = Path();
    double w1 = size.width / 12;
    path1.moveTo(0, 0);
    path1.cubicTo(
      w1,
      size.height * 0.5625,
      w1 * 2,
      size.height * 0.7265,
      w1 * 3,
      size.height * 0.8203,
    );
    path1.cubicTo(
      w1 * 4,
      size.height * 0.8906,
      w1 * 5,
      size.height * 0.9375,
      w1 * 6,
      size.height * 0.9609,
    );
    path1.cubicTo(
      w1 * 7,
      size.height * 0.9765,
      w1 * 8,
      size.height * 0.9765,
      w1 * 9,
      size.height * 0.9609,
    );
    path1.cubicTo(
      w1 * 10,
      size.height * 0.9609,
      w1 * 11,
      size.height * 0.9687,
      w1 * 12,
      size.height * 0.9843,
    );
    path1.lineTo(size.width, 0);
    path1.lineTo(0, 0);
    path1.close();

    final paint1 = Paint()..color = const Color(0xff4B3F6B);
    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

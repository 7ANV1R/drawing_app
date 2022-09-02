// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';

class CustomDrawing extends CustomPainter {
  List<Offset?> points;
  CustomDrawing({
    required this.points,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2.0
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        log('drawing line');
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      } else if (points[i] != null && points[i + 1] == null) {
        log('drawing point');
        canvas.drawPoints(PointMode.points, [points[i]!], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

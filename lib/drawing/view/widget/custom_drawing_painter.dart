// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ui';

import 'package:drawing_app/drawing/view/model/drawing_model.dart';
import 'package:flutter/material.dart';

class CustomDrawing extends CustomPainter {
  final List<DrawingPaths?> drawingPaths;

  CustomDrawing(this.drawingPaths);

  List<Offset> offsetsList = [];

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawingPaths.length - 1; i++) {
      if (drawingPaths[i] != null && drawingPaths[i + 1] != null) {
        canvas.drawLine(drawingPaths[i]!.offset, drawingPaths[i + 1]!.offset, drawingPaths[i]!.paint);
      } else if (drawingPaths[i] != null && drawingPaths[i + 1] == null) {
        offsetsList.clear();
        offsetsList.add(drawingPaths[i]!.offset);

        canvas.drawPoints(PointMode.points, offsetsList, drawingPaths[i]!.paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

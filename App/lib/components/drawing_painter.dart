import 'dart:ui';

import 'package:draw/models/drawing_points.dart';
import 'package:draw/pages/DrawngPage/enums/paint_type.dart';
import 'package:flutter/material.dart';

class DrawingPainter extends CustomPainter {
  DrawingPainter({
    required this.repaint,
    required this.pointsList,
  });

  List<DrawingPoints?> pointsList;
  bool repaint;

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < pointsList.length; i++) {
      var point = pointsList[i];
      if (point != null) {
        switch (point.paintType) {
          case PaintType.brush:
            brushPaint(canvas, i, point);
            break;
          case PaintType.filler:
            break;
          case PaintType.eraser:
            break;
        }
      }
    }
  }

  brushPaint(Canvas canvas, int i, DrawingPoints point) {
    var nextPoint = i < pointsList.length - 1 ? pointsList[i + 1] : null;

    if (nextPoint != null) {
      canvas.drawLine(point.points, nextPoint.points, point.paint);
    } else {
      canvas.drawPoints(PointMode.points, [point.points], point.paint);
    }
  }

  @override
  bool shouldRepaint(oldDelegate) => repaint;
  //oldDelegate.pointsList != pointsList;
}

import 'package:draw/models/drawing_points.dart';
import 'package:flutter/material.dart';

class DrawingPainter extends CustomPainter {
  DrawingPainter({required this.repaint, required this.pointsList});
  List<DrawingPoints?> pointsList;
  /* List<Offset> offsetPoints = []; */
  final bool repaint;

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < pointsList.length; i++) {
      var point = pointsList[i];
      var nextPoint = i < pointsList.length - 1 ? pointsList[i + 1] : null;
      if (point != null) {
        if (nextPoint != null) {
          canvas.saveLayer(Rect.largest, point.paint);
          canvas.drawLine(point.points, nextPoint.points, point.paint);
          canvas.restore();
        } /*  else {
          offsetPoints.clear();
          offsetPoints.add(point.points);
          offsetPoints
              .add(Offset(point.points.dx + 0.1, point.points.dy + 0.1));
          canvas.drawPoints(PointMode.points, offsetPoints, point.paint);
        } */
      }
    }
  }

  @override
  bool shouldRepaint(oldDelegate) => repaint;
  //oldDelegate.pointsList != pointsList;
}

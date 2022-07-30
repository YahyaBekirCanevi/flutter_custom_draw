import 'package:draw/pages/DrawngPage/enums/paint_type.dart';
import 'package:flutter/material.dart';

class DrawingPoints {
  Paint paint;
  Offset points;
  PaintType paintType;

  DrawingPoints({
    required this.paint,
    required this.points,
    required this.paintType,
  });
}

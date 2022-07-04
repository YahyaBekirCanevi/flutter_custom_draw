import 'package:flutter/material.dart';

class Brush {
  Color selectedColor;
  double opacity;
  double strokeWidth;

  Brush({
    required this.selectedColor,
    this.opacity = 1,
    this.strokeWidth = 3,
  });
}

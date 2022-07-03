import 'package:flutter/material.dart';

class TransformComponent {
  double x = 0, y = 0;
  double xRot = 0, yRot = 0;
  double size = 1;

  getTransform() => Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, x, y, 0, 1)
    ..scale(size)
    ..rotateX(xRot)
    ..rotateY(yRot);
}

import 'package:draw/enums/paint_type.dart';
import 'package:draw/models/brush.dart';
import 'package:draw/models/drawing_points.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawingController extends GetxController {
  DrawingController({
    required double screenWidth,
    required double screenHeight,
  }) {
    width.value = screenWidth;
    height.value = screenHeight;
  }
  var width = 0.0.obs;
  var height = 0.0.obs;
  var paintType = PaintType.brush.obs;
  var brush = Brush(selectedColor: Colors.black).obs;

  var points = <DrawingPoints?>[].obs;
}

// ignore_for_file: avoid_print, must_be_immutable, invalid_use_of_protected_member

import 'package:draw/components/drawing_painter.dart';
import 'package:draw/enums/paint_type.dart';
import 'package:draw/models/drawing_points.dart';
import 'package:draw/pages/DrawingPage/components/drawing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class Painter extends HookWidget {
  Painter({
    Key? key,
  }) : super(key: key);

  final isPainting = useState(false);
  final point = useState<DrawingPoints?>(null);
  final DrawingController controller = Get.find();

  onPan(context, details) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = controller.brush.value.strokeWidth
      ..color = controller.brush.value.selectedColor.withOpacity(
        controller.brush.value.opacity,
      );
    print('style' + paint.style.toString());
    if (controller.paintType.value == PaintType.eraser) {
      paint = paint..blendMode = BlendMode.clear;
    }
    return DrawingPoints(
      points: renderBox.globalToLocal(details.globalPosition),
      paint: paint,
    );
  }

  @override
  build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        print("Started");
        isPainting.value = true;
        point.value = onPan(context, details);
        List<DrawingPoints?> list = controller.points.value;
        list.add(point.value);
        controller.points.value = list;
      },
      onPanUpdate: (details) {
        print('${details.globalPosition}');
        point.value = onPan(context, details);
        List<DrawingPoints?> list = controller.points.value;
        list.add(point.value);
        controller.points.value = list;
      },
      onPanEnd: (details) {
        print("Ended");
        isPainting.value = false;
        List<DrawingPoints?> list = controller.points.value;
        list.add(null);
        controller.points.value = list;
      },
      child: Obx(
        () => SizedBox(
          width: controller.width.value,
          height: controller.height.value,
          child: CustomPaint(
            painter: DrawingPainter(
              pointsList: controller.points.value,
              repaint: isPainting.value,
            ),
          ),
        ),
      ),
    );
  }
}

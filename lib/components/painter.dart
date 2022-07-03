// ignore_for_file: avoid_print

import 'package:draw/components/drawing_painter.dart';
import 'package:draw/enums/paint_type.dart';
import 'package:draw/models/brush.dart';
import 'package:draw/models/drawing_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Painter extends HookWidget {
  const Painter({
    Key? key,
    required this.width,
    required this.height,
    required this.brush,
    required this.paintType,
  }) : super(key: key);

  final double width;
  final double height;
  final PaintType paintType;
  final Brush brush;

  onPan(context, details) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    return DrawingPoints(
      points: renderBox.globalToLocal(details.globalPosition),
      paint: Paint()
        ..strokeCap = StrokeCap.round
        ..isAntiAlias = true
        ..color = brush.selectedColor.withOpacity(brush.opacity)
        ..strokeWidth = brush.strokeWidth,
    );
  }

  @override
  build(BuildContext context) {
    var isPainting = useState(false);
    var points = useState<List<DrawingPoints?>>([]);

    return GestureDetector(
      onPanStart: (details) {
        print("Started");
        isPainting.value = true;
        points.value.add(onPan(context, details));
      },
      onPanUpdate: (details) {
        print('${details.globalPosition}');
        points.value.add(onPan(context, details));
      },
      onPanEnd: (details) {
        print("Ended");
        isPainting.value = false;
        points.value.add(null);
      },
      child: SizedBox(
        width: width,
        height: height,
        child: CustomPaint(
          painter: DrawingPainter(
            pointsList: points.value,
            repaint: isPainting.value,
          ),
        ),
      ),
    );
  }
}

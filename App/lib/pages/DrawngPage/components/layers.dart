import 'package:draw/components/painter.dart';
import 'package:draw/enums/paint_type.dart';
import 'package:draw/models/brush.dart';
import 'package:draw/pages/DrawngPage/components/transform_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Layers extends StatelessWidget {
  Layers({
    Key? key,
    required this.paintType,
    required this.width,
    required this.height,
    required this.brush,
  }) : super(key: key);

  final double width;
  final double height;
  final Brush brush;
  final PaintType paintType;

  //int layerCount = 1;

  var transform = TransformComponent();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color(0xFF666688),
          child: const SizedBox.expand(),
        ),
        Transform(
          transform: transform.getTransform(),
          child: Layer(
            width: width,
            height: height,
            brush: brush,
            paintType: paintType,
          ),
        ),
        /* ...List.generate(
          layerCount,
          (index) => 
        ), */
      ],
    );
  }
}

class Layer extends HookWidget {
  const Layer({
    Key? key,
    required this.width,
    required this.height,
    required this.brush,
    required this.paintType,
  }) : super(key: key);

  final double width;
  final double height;
  final Brush brush;
  final PaintType paintType;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[50],
      child: Painter(
        width: width,
        height: height,
        paintType: paintType,
        brush: brush,
      ),
    );
  }
}

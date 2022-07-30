import 'package:draw/components/painter.dart';
import 'package:draw/pages/DrawngPage/components/transform_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Layers extends StatelessWidget {
  Layers({
    Key? key,
  }) : super(key: key);

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
          child: const Layer(),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[50],
      child: const Painter(),
    );
  }
}

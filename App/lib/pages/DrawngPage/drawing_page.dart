// ignore_for_file: avoid_print

import 'package:draw/enums/paint_type.dart';
import 'package:draw/models/brush.dart';
import 'package:draw/pages/DrawngPage/components/bottom_bar.dart';
import 'package:draw/pages/DrawngPage/components/layers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DrawingPage extends HookWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var paintType = useState(PaintType.brush);
    var brush = useState(Brush(selectedColor: Colors.black));

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Layers(
              width: width,
              height: height,
              paintType: paintType.value,
              brush: brush.value,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: BottomBar(
                height: 80,
                onPaintChange: (e) => paintType.value = e,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

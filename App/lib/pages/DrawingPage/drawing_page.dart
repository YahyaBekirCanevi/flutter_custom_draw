// ignore_for_file: avoid_print

import 'package:draw/pages/DrawingPage/components/bottom_bar.dart';
import 'package:draw/pages/DrawingPage/components/drawing_controller.dart';
import 'package:draw/pages/DrawingPage/components/layers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawingPage extends StatelessWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final controller = Get.put(DrawingController(
      screenHeight: height,
      screenWidth: width,
    ));

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Layers(),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: BottomBar(
                height: 80,
                onPaintChange: (e) => controller.paintType.value = e,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

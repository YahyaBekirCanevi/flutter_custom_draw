import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum PaintType {
  brush,
  filler,
  eraser,
}

extension PaintTypeExtension on PaintType {
  IconData getIcon() {
    switch (this) {
      case PaintType.brush:
        return FontAwesomeIcons.brush;
      case PaintType.eraser:
        return FontAwesomeIcons.fill;
      case PaintType.filler:
        return FontAwesomeIcons.eraser;
      default:
        return FontAwesomeIcons.plus;
    }
  }
}

part of 'paint_brush_bloc.dart';

class PaintBrush extends Equatable {
  final double width;
  final double height;
  final Color selectedColor;
  final PaintType paintType;
  final double opacity;
  final double strokeWidth;

  const PaintBrush({
    required this.width,
    required this.height,
    required this.selectedColor,
    required this.paintType,
    this.opacity = 1,
    this.strokeWidth = 3,
  });

  PaintBrush copyWith({
    double? width,
    double? height,
    Color? selectedColor,
    PaintType? paintType,
    double? opacity,
    double? strokeWidth,
  }) {
    return PaintBrush(
      width: width ?? this.width,
      height: height ?? this.height,
      selectedColor: selectedColor ?? this.selectedColor,
      paintType: paintType ?? this.paintType,
      opacity: opacity ?? this.opacity,
      strokeWidth: strokeWidth ?? this.strokeWidth,
    );
  }

  @override
  List<Object?> get props => [
        width,
        height,
        selectedColor,
        paintType,
        opacity,
        strokeWidth,
      ];
}

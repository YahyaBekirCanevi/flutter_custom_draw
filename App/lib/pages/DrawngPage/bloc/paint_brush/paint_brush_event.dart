part of 'paint_brush_bloc.dart';

class PaintBrushEvent extends Equatable {
  final PaintBrush state;

  const PaintBrushEvent(this.state);
  @override
  List<Object?> get props => [state];
}

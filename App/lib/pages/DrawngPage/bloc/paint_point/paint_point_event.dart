part of 'paint_point_bloc.dart';

class PaintPointEvent extends Equatable {
  final PaintPointState state;

  const PaintPointEvent(this.state);

  @override
  List<Object?> get props => [state];
}

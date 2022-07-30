import 'package:bloc/bloc.dart';
import 'package:draw/models/drawing_points.dart';
import 'package:equatable/equatable.dart';

part 'paint_point_event.dart';
part 'paint_point_state.dart';

class PaintPointBloc extends Bloc<PaintPointEvent, PaintPointState> {
  PaintPointBloc() : super(PaintPointState()) {
    on<PaintPointEvent>((event, emit) => emit(event.state));
  }
}

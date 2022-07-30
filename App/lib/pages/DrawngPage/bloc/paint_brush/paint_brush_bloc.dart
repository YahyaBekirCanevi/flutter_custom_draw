import 'package:bloc/bloc.dart';
import 'package:draw/pages/DrawngPage/enums/paint_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'paint_brush_event.dart';
part 'paint_brush_state.dart';

class PaintBrushBloc extends Bloc<PaintBrushEvent, PaintBrush> {
  PaintBrushBloc({required PaintBrush initState}) : super(initState) {
    on<PaintBrushEvent>((event, emit) => emit(event.state));
  }
}

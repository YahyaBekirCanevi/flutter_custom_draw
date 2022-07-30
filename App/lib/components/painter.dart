import 'package:draw/components/drawing_painter.dart';
import 'package:draw/models/drawing_points.dart';
import 'package:draw/pages/DrawngPage/bloc/paint_brush/paint_brush_bloc.dart';
import 'package:draw/pages/DrawngPage/bloc/paint_point/paint_point_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Painter extends HookWidget {
  const Painter({
    Key? key,
  }) : super(key: key);

  onPan(context, PaintBrush state, details) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    return DrawingPoints(
      paintType: state.paintType,
      points: renderBox.globalToLocal(details.globalPosition),
      paint: Paint()
        ..strokeCap = StrokeCap.round
        ..isAntiAlias = true
        ..color = state.selectedColor.withOpacity(state.opacity)
        ..strokeWidth = state.strokeWidth,
    );
  }

  @override
  build(BuildContext context) {
    var list = useState(<DrawingPoints?>[]);
    var paintBrushBloc =
        useMemoized(() => BlocProvider.of<PaintBrushBloc>(context));
    var paintPointBloc =
        useMemoized(() => BlocProvider.of<PaintPointBloc>(context));
    return BlocBuilder<PaintPointBloc, PaintPointState>(
      bloc: paintPointBloc,
      builder: (context, paintPointState) {
        return BlocBuilder<PaintBrushBloc, PaintBrush>(
          bloc: paintBrushBloc,
          builder: (context, paintBrushState) {
            return GestureDetector(
              onPanStart: (details) {
                paintPointState.add(onPan(context, paintBrushState, details));
                paintPointState.isPainting = true;
                paintPointBloc.add(PaintPointEvent(paintPointState));
                list.value = paintPointState.getList;
              },
              onPanUpdate: (details) {
                //print('${details.globalPosition}');

                paintPointState.add(onPan(context, paintBrushState, details));
                paintPointBloc.add(PaintPointEvent(paintPointState));
                list.value = paintPointState.getList;
              },
              onPanEnd: (details) {
                paintPointState.add(null);
                paintPointState.isPainting = false;
                paintPointBloc.add(PaintPointEvent(paintPointState));
                list.value = paintPointState.getList;
              },
              child: SizedBox(
                width: paintBrushState.width,
                height: paintBrushState.height,
                child: CustomPaint(
                  painter: DrawingPainter(
                    pointsList: list.value,
                    repaint: paintPointState.isPainting,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

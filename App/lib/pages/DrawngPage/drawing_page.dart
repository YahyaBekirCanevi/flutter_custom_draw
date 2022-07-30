import 'package:draw/pages/DrawngPage/bloc/paint_brush/paint_brush_bloc.dart';
import 'package:draw/pages/DrawngPage/bloc/paint_point/paint_point_bloc.dart';
import 'package:draw/pages/DrawngPage/components/bottom_bar.dart';
import 'package:draw/pages/DrawngPage/components/layers.dart';
import 'package:draw/pages/DrawngPage/enums/paint_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DrawingPage extends HookWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var paintType = useState(PaintType.brush);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    PaintBrushBloc brushBloc = PaintBrushBloc(
      initState: PaintBrush(
        width: width,
        height: height,
        paintType: paintType.value,
        selectedColor: Colors.black,
      ),
    );
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => brushBloc,
          ),
          BlocProvider(
            create: (context) => PaintPointBloc(),
          ),
        ],
        child: Scaffold(
          body: BlocBuilder<PaintBrushBloc, PaintBrush>(
            bloc: brushBloc,
            builder: (context, state) {
              return Stack(
                children: [
                  Layers(),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: BottomBar(
                      onPaintChange: (e) {
                        /* paintType.value = e;
                        brushBloc
                            .add(PaintBrushEvent(state.copyWith(paintType: e))); */
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

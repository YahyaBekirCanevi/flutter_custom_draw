import 'package:draw/pages/DrawngPage/bloc/paint_point/paint_point_bloc.dart';
import 'package:draw/pages/DrawngPage/enums/paint_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends HookWidget {
  final Function(PaintType) onPaintChange;
  final _duration = const Duration(milliseconds: 600);

  const BottomBar({
    Key? key,
    required this.onPaintChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isOpen = useState(false);
    var ticker = useSingleTickerProvider(keys: [1, 0]);
    var anim = useAnimationController(duration: _duration, vsync: ticker);
    return Container(
      width: 60,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF888888),
            Color(0xFF666666),
            Color(0xFF666666),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Wrap(
        children: [
          Center(
            child: AnimatedContainer(
              duration: _duration,
              curve: Curves.bounceOut,
              height: isOpen.value ? 3 * 60 : 0,
              child: BlocBuilder<PaintPointBloc, PaintPointState>(
                bloc: BlocProvider.of<PaintPointBloc>(context),
                builder: (context, state) => Wrap(
                  children: [
                    buildMenuItem(
                      FontAwesomeIcons.brush,
                      isOpen,
                      () {},
                    ),
                    buildMenuItem(
                      FontAwesomeIcons.arrowRotateLeft,
                      isOpen,
                      () {
                        state.takeBack();
                        BlocProvider.of<PaintPointBloc>(context)
                            .add(PaintPointEvent(state));
                      },
                    ),
                    buildMenuItem(
                      FontAwesomeIcons.arrowRotateRight,
                      isOpen,
                      () {
                        state.putBack();
                        BlocProvider.of<PaintPointBloc>(context)
                            .add(PaintPointEvent(state));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              isOpen.value ? anim.reverse() : anim.forward();
              isOpen.value = !isOpen.value;
            },
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF666666),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Center(
                child: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  color: Colors.white,
                  progress: anim,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildMenuItem(icon, isOpen, Function() onTap) => AnimatedScale(
        curve: Curves.bounceOut,
        duration: _duration,
        scale: isOpen.value ? 1 : 0,
        child: InkWell(
          onTap: () => onTap(),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            maxRadius: 30,
            minRadius: 0,
            child: FaIcon(
              icon, //.getIcon(),
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      );
}

import 'package:draw/enums/paint_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends HookWidget {
  final Function(PaintType) onPaintChange;
  final double height;

  const BottomBar({
    Key? key,
    required this.onPaintChange,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isOpen = useState(true);
    return Container(
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF888888),
            Color(0xFF666666),
            Color(0xFF666666),
            Color(0xFF666666),
            Color(0xFF666666),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => isOpen.value = !isOpen.value,
            child: const SizedBox(
              width: 100,
              child: Divider(
                color: Colors.white,
                thickness: 2,
              ),
            ),
          ),
          Visibility(
            visible: isOpen.value,
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: PaintType.values
                    .map(
                      (e) => InkWell(
                        onTap: () => onPaintChange(e),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 24,
                          child: FaIcon(
                            e.getIcon(),
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

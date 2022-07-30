part of 'paint_point_bloc.dart';

class PaintPointState extends Equatable {
  bool isPainting;
  List<List<DrawingPoints?>> list, reverted = [];
  late int _lastIndex;

  PaintPointState({
    this.isPainting = false,
    this.list = const [],
  }) {
    _lastIndex = -1;
  }

  add(DrawingPoints? point) {
    if (list.isEmpty) list = [];
    if (_lastIndex == -1 || !isPainting) {
      _lastIndex++;
      list.add(<DrawingPoints?>[]);
    }
    if (list[_lastIndex].isEmpty) list[_lastIndex] = [];
    list[_lastIndex].add(point);
  }

  takeBack() {
    if (list.isEmpty) return;
    print("takeBack");
    if (reverted.isEmpty) reverted = [];
    reverted.add(list.last);
    list.removeLast();
  }

  putBack() {
    if (reverted.isEmpty) return;
    print("putBack");
    if (list.isEmpty) reverted = [];
    list.add(reverted.last);
    reverted.removeLast();
  }

  List<DrawingPoints?> get getList => list.expand((i) => i).toList();

  @override
  List<Object?> get props => [isPainting, _lastIndex, getList.length];
}

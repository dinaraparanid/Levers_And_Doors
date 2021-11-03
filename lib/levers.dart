import 'dart:math';

class Lever {
  static late int numberOfPositions;
  final int _curPosition;
  Lever(this._curPosition);

  factory Lever.random() => Lever(1 + Random.secure().nextInt(numberOfPositions));

  int get currentPosition => _curPosition;

  @override
  String toString() => "$currentPosition";
}
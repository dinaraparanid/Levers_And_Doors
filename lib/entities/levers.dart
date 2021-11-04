import 'dart:math';

class Lever {
  final int _numberOfPositions;
  int _curPosition;
  Lever._(this._numberOfPositions, this._curPosition);

  factory Lever.random(final int numberOfPositions) =>
      Lever._(numberOfPositions, 1 + Random.secure().nextInt(numberOfPositions));

  int get currentPosition => _curPosition;
  int get numberOfPositions => _numberOfPositions;

  int up() => _curPosition = min(_numberOfPositions, _curPosition + 1);
  int down() => _curPosition = max(_numberOfPositions, _curPosition - 1);

  @override
  String toString() => '$currentPosition';
}
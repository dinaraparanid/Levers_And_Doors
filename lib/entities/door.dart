import 'dart:math';

import 'package:collection/collection.dart';

class Door {
  static late int leversAmount;
  final List<int> _positions;
  final int number;

  Door._(this._positions, this.number);

  factory Door.random(
      final int number,
      final List<int> leversMaxPositions
  ) => Door._(
      List.generate(
          leversAmount,
              (x) => 1 + Random.secure().nextInt(leversMaxPositions[x])
      ),
      number
  );

  bool canBeOpened(final Iterable<int> positions) =>
      IterableEquality().equals(_positions, positions);

  @override
  String toString() => '$number: $_positions';
}
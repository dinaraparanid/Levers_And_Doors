import 'dart:math';

import 'package:collection/collection.dart';
import 'package:kek/levers.dart';

class Door {
  static late int leversAmount;
  final Iterable<int> _positions;
  final int number;

  Door(this._positions, this.number);

  factory Door.random(final int number) => Door(
      Iterable.generate(
          leversAmount,
              (_) => 1 + Random.secure().nextInt(Lever.numberOfPositions)
      ),
      number
  );

  bool canBeOpened(final Iterable<int> positions) =>
      IterableEquality().equals(_positions, positions);

  @override
  String toString() => "$number: $_positions";
}
import 'package:kek/utils/command.dart';
import 'package:kek/entities/door.dart';
import 'package:kek/entities/levers.dart';
import 'package:kek/utils/side.dart';

class Room {
  late List<Lever> _levers;
  late List<Door> _doors;

  void checkConfiguration() {
    final openedDoors = _doors.where(
            (element) => element.canBeOpened(_levers.map((e) => e.currentPosition))
    );

    if (openedDoors.isEmpty) {
      print('There are no opened doors...');
    } else {
      openedDoors.forEach((element) => print('Door № ${element.number} is opened'));
    }
  }

  void setConfiguration(
      final int n,
      final int m,
      final List<int> leversPositions
  ) {
    Door.leversAmount = n;
    _levers = List.generate(n, (x) => Lever.random(leversPositions[x]));
    _doors = List.generate(m, (x) => Door.random(x + 1, leversPositions));
  }

  void updateConfiguration(final Command command) {
    switch (command.side) {
      case Side.up:
        _levers[command.index].up();
        break;
      case Side.down:
        _levers[command.index].down();
        break;
    }
  }

  void printConfiguration() {
    print('Levers:');
    _levers.forEach((element) => print(element.toString()));

    print('Doors:');
    _doors.forEach((element) => print(element.toString()));
  }
}
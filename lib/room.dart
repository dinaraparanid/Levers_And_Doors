import 'package:kek/door.dart';
import 'package:kek/levers.dart';

class Room {
  Iterable<Lever> _levers = Iterable.empty();
  Iterable<Door> _doors = Iterable.empty();

  Room._(); // default constructor is private
  static final Room _instance = Room._();
  static Room get instance => _instance;

  void checkConfiguration() {
    final openedDoors = _doors.where(
            (element) => element.canBeOpened(_levers.map((e) => e.currentPosition))
    );

    if (openedDoors.isEmpty) {
      print("There are no opened doors...");
    } else {
      openedDoors.forEach((element) => print("Door № ${element.number} is opened"));
    }
  }

  void updateConfiguration(final int n, final int m, final int numberOfPositions) {
    Lever.numberOfPositions = numberOfPositions;
    Door.leversAmount = n;
    _levers = Iterable.generate(n, (_) => Lever.random());
    _doors = Iterable.generate(m, (x) => Door.random(x + 1));
  }

  void printConfiguration() {
    print("Levers:");
    for (var element in _levers) {
      print(element.toString());
    }

    print("Doors:");
    for (var element in _doors) {
      print(element.toString());
    }
  }
}
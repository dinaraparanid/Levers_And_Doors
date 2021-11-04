import 'package:kek/entities/door.dart';
import 'package:kek/game.dart';
import 'package:kek/utils/command.dart';
import 'package:kek/entities/room.dart';
import 'package:kek/utils/side.dart';
import 'package:kek/states/state.dart';
import 'package:kek/utils/parse.dart';

class Move implements State {
  late final Room _room = Game.instance.room;

  @override
  void run() {
    late final leversRange = Iterable.generate(Door.leversAmount, (x) => x + 1);
    late final sideRange = Iterable.generate(2, (x) => x + 1);

    final int ind = readingIntUntilOk(
        'Enter the number of level: ',
        additionalChecks: List.filled(1, (x) => leversRange.contains(x))
    ) - 1;

    final int side = readingIntUntilOk(
      'Enter the side to move lever:\n1) up\n2) down\n',
      additionalChecks: List.filled(1, (x) => sideRange.contains(x))
    ) - 1;

    _room.updateConfiguration(Command(ind, Side.values[side]));
    _room.printConfiguration();
    _room.checkConfiguration();
  }
}
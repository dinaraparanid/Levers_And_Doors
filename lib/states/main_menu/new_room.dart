import 'package:kek/entities/room.dart';
import 'package:kek/game.dart';
import 'package:kek/states/state.dart';
import 'package:kek/utils/parse.dart';

class NewRoom implements State {
  @override
  void run() {
    final n = readingIntUntilOk(
        'Enter the number of levers: ',
        additionalChecks: List.filled(1, (x) => x > 0)
    );

    final m = readingIntUntilOk(
        'Enter the number of doors: ',
        additionalChecks: List.filled(1, (x) => x > 0)
    );

    final posCheck = List<Function>.empty(growable: true);
    posCheck.add((x) => x > 0);
    posCheck.add((x) => x < 11);

    print('Enter the maximum number of positions for each lever.');

    final leversPositions = List.generate(n, (x) => readingIntUntilOk(
        'Enter the maximum number of positions for Lever № ${x + 1}: ',
        additionalChecks: posCheck
    ));

    Game.instance.goToNextLevel();
    Game.instance.room = Room();
    Game.instance.room.setConfiguration(n, m, leversPositions);
    Game.instance.room.printConfiguration();
    Game.instance.room.checkConfiguration();
  }
}
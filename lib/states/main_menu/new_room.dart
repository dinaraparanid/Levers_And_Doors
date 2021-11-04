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

    print('Enter the maximum number of positions for each lever.');

    final leversPositions = List.generate(n, (x) => readingIntUntilOk(
        'Enter the maximum number of positions for Lever № ${x + 1}: ',
        additionalChecks: List.filled(1, (x) => x > 0 && x < 11)
    ));

    Game.instance.goToNextLevel();
    Game.instance.room = Room();
    Game.instance.room.setConfiguration(n, m, leversPositions);
    Game.instance.room.checkConfiguration();
  }
}
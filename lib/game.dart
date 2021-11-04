import 'package:kek/entities/room.dart';
import 'package:kek/states/game/finish.dart';
import 'package:kek/states/game/move.dart';
import 'package:kek/states/main_menu/exit.dart';
import 'package:kek/states/main_menu/new_room.dart';
import 'package:kek/states/state.dart';
import 'package:kek/utils/parse.dart';

class Game {
  Game._();
  static late final _instance = Game._();
  static Game get instance => _instance;

  late Room room;
  late int _level = 0;

  late final List<State> mainMenuStates;
  late final List<State> gameStates;

  void start() {
    mainMenuStates = List.empty(growable: true);
    mainMenuStates.add(NewRoom());
    mainMenuStates.add(Exit());

    gameStates = List.empty(growable: true);
    gameStates.add(Move());
    gameStates.add(Finish());

    final commandRange = Iterable.generate(2, (x) => x + 1);

    while (true) {
      _printMenu();

      _executeState(
          readingIntUntilOk(
              'Print command number: ',
              additionalChecks: List.filled(1, (x) => commandRange.contains(x))
          ) - 1
      );
    }
  }

  void _printMainMenu() {
    print('1. New room');
    print('2. Exit');
  }

  void _printGameMenu() {
    print('1. Move');
    print('2. Finish');
  }

  void _printMenu() => _level == 0 ? _printMainMenu() : _printGameMenu();

  void _executeState(final int command) =>
      (_level == 0 ? mainMenuStates[command] : gameStates[command]).run();
  
  void goToNextLevel() => _level++;
  void goToPrevLevel() => _level--;
}
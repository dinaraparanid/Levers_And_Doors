import 'package:kek/game.dart';
import 'package:kek/states/state.dart';

class Finish implements State {
  @override
  void run() => Game.instance.goToPrevLevel();
}
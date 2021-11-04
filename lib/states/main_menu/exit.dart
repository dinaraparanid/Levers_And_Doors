import 'dart:io';

import 'package:kek/states/state.dart';

class Exit implements State {
  @override
  void run() => exit(0);
}
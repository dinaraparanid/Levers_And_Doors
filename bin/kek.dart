import 'dart:io';

import 'package:kek/room.dart';

int readingIntUntilOk(final String message, [final List<Function>? additionalChecks]) {
  while (true) {
    stdout.write(message);

    final inp = stdin.readLineSync();

    if (inp != null) {
      final input = int.tryParse(inp);
      
      if (input != null &&
          additionalChecks != null &&
          additionalChecks.indexWhere((func) => !func(input)) == -1) {
        return input;
      } else {
        print('Incorrect input. Try again.');
      }
    } else {
      print('Incorrect input. Try again.\n');
    }
  }
}

void main(final List<String> arguments) {
  do {
    final n = readingIntUntilOk(
        'Enter the number of levers: ',
        List.filled(1, (x) => x > 0)
    );

    final m = readingIntUntilOk(
        'Enter the number of doors: ',
        List.filled(1, (x) => x > 0)
    );

    final posCheck = List<Function>.empty(growable: true);
    posCheck.add((x) => x > 0);
    posCheck.add((x) => x < 11);

    final numberOfPositions = readingIntUntilOk(
        'Enter the number of positions: ',
        posCheck
    );

    Room.instance.updateConfiguration(n, m, numberOfPositions);
    Room.instance.printConfiguration();
    Room.instance.checkConfiguration();

    stdout.write("Print '1' to exit: ");
    final input = stdin.readLineSync();

    if (input != null) {
      final parse = int.tryParse(input);

      if (parse != null && parse == 1) {
        return;
      }
    }
  } while (true);
}

import 'dart:io';

int readingIntUntilOk(
    final String message,
    {final List<Function>? additionalChecks}
    ) {
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
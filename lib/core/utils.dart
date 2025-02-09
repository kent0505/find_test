import 'dart:developer' as developer;

import 'models/game.dart';

void logger(Object message) {
  developer.log(message.toString());
}

int getTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

List<Game> generateGames(int startIndex) {
  return List.generate(12, (i) => Game(id: i + 1, index: startIndex + i));
}

import 'dart:developer' as developer;

import 'package:shared_preferences/shared_preferences.dart';

import 'models/game.dart';

int coins = 0;
int currentBG = 1;
bool bought2 = false;
bool bought3 = false;
// List<Stats> statsList = [];

Future<void> getDATA() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.clear();
  coins = prefs.getInt('coins') ?? 0;
  currentBG = prefs.getInt('currentBG') ?? 1;
  bought2 = prefs.getBool('bought2') ?? false;
  bought3 = prefs.getBool('bought3') ?? false;

  // await Hive.initFlutter();
  // // await Hive.deleteBoxFromDisk('find_test_box');
  // Hive.registerAdapter(StatsAdapter());
  // final box = await Hive.openBox('find_test_box');
  // List data = await box.get('statsList') ?? [];
  // statsList = data.cast<Stats>();
}

// Future<void> updateModels() async {
//   final box = await Hive.openBox('find_test_box');
//   await box.put('statsList', statsList);
//   statsList = await box.get('statsList');
// }

Future<void> saveINT(String key, int value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt(key, value);
}

Future<void> saveBOOL(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}

void logger(Object message) {
  developer.log(message.toString());
}

int getTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

List<Game> generateGames(int startIndex) {
  return List.generate(12, (i) => Game(id: i + 1, index: startIndex + i));
}

class Game {
  Game({
    required this.id,
    required this.index,
    this.active = false,
    this.done = false,
  });

  final int id;
  final int index;
  bool active;
  bool done;
}

part of 'game_bloc.dart';

@immutable
sealed class GameEvent {}

final class LoadGames extends GameEvent {}

final class ShuffleGames extends GameEvent {}

final class SelectGame extends GameEvent {
  SelectGame({required this.game});

  final Game game;
}

final class FinishGame extends GameEvent {
  FinishGame({required this.win});

  final bool win;
}

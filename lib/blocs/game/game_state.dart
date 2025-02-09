part of 'game_bloc.dart';

@immutable
sealed class GameState {}

final class GameInitial extends GameState {}

final class GamesLoaded extends GameState {
  GamesLoaded({
    required this.games,
    this.started = true,
  });

  final List<Game> games;
  final bool started;
}

final class GameOver extends GameState {
  GameOver({required this.win});

  final bool win;
}

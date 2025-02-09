import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/models/game.dart';
import '../../core/utils.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  List<Game> games = generateGames(1);
  bool remember = false;
  bool canTap = true;

  GameBloc() : super(GameInitial()) {
    on<LoadGames>((event, emit) async {
      emit(GamesLoading());
      games.addAll(generateGames(13));
      emit(GamesLoaded(
        games: games,
        started: false,
      ));
    });

    on<ShuffleGames>((event, emit) async {
      logger('SHUFFLE');
      games.shuffle();
      for (Game game in games) {
        game.active = false;
        game.done = false;
      }
      emit(GamesLoaded(games: games));
    });

    on<SelectGame>((event, emit) async {
      if (event.game.active) return;
      logger('NOT ACTIVE');
      for (Game game in games) {
        if (game.index == event.game.index) game.active = true;
      }
      emit(GamesLoaded(games: games));
      if (remember) {
        canTap = false;
        final first = games.firstWhere((game) => game.active && !game.done);
        final second = games.lastWhere((game) => game.active && !game.done);
        if (first.id == second.id) {
          first.done = true;
          second.done = true;
          canTap = true;
          remember = false;
          emit(GamesLoaded(games: games));
          bool finished = games.every((game) => game.done);
          if (finished) add(FinishGame(win: true));
        } else {
          await Future.delayed(Duration(milliseconds: 400), () {
            first.active = false;
            second.active = false;
            remember = false;
            canTap = true;
            emit(GamesLoaded(games: games));
          });
        }
      } else {
        remember = true;
        emit(GamesLoaded(games: games));
      }
    });

    on<FinishGame>((event, emit) async {
      logger('FINISH');
      emit(GameOver(win: event.win));
    });
  }
}

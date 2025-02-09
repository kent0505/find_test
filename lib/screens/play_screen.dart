import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/game/game_bloc.dart';
import '../blocs/timer/timer_bloc.dart';
import '../widgets/game_over_dialog.dart';
import '../widgets/game_card.dart';
import '../widgets/loading_widget.dart';
import '../widgets/main_button.dart';
import '../widgets/scaffold2.dart';
import '../widgets/title_widget.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  void dispose() {
    context.read<TimerBloc>().add(StopTimer());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold2(
      body: Column(
        children: [
          BlocBuilder<TimerBloc, TimerState>(
            builder: (context, state) {
              return TitleWidget(
                play: true,
                seconds: state is TimerStarted ? state.second : 30,
              );
            },
          ),
          Spacer(),
          SizedBox(
            width: 60 * 4 + 30,
            child: MultiBlocListener(
              listeners: [
                // BlocListener<TimerBloc, TimerState>(
                //   listener: (context, state) {
                //     if (state is TimerStopped  ) {
                //       context.read<GameBloc>().add(FinishGame(win: false));
                //     }
                //   },
                // ),
                BlocListener<GameBloc, GameState>(
                  listener: (context, state) {
                    if (state is GameOver) {
                      // context
                      //     .read<TimerBloc>()
                      //     .add(StopTimer(end: !state.win));
                      showDialog(
                        context: context,
                        builder: (context) {
                          return GameOverDialog(win: state.win);
                        },
                      );
                    }
                  },
                ),
              ],
              child: BlocBuilder<GameBloc, GameState>(
                builder: (context, state) {
                  if (state is GamesLoading) {
                    return LoadingWidget();
                  }

                  if (state is GamesLoaded) {
                    return Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(
                        state.games.length,
                        (index) {
                          return GameCard(
                            game: state.games[index],
                            canTap: context.read<GameBloc>().canTap &&
                                state.started,
                            onPressed: (game) {
                              context
                                  .read<GameBloc>()
                                  .add(SelectGame(game: game));
                            },
                          );
                        },
                      ),
                    );
                  }

                  return SizedBox();
                },
              ),
            ),
          ),
          Spacer(),
          BlocBuilder<GameBloc, GameState>(
            builder: (context, state) {
              if (state is GamesLoaded && !state.started) {
                return MainButton(
                  title: 'START',
                  onPressed: () {
                    context.read<TimerBloc>().add(StartTimer(seconds: 30));
                    context.read<GameBloc>().add(ShuffleGames());
                  },
                );
              }

              return SizedBox(height: 50);
            },
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

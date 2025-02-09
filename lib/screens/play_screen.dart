import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/game/game_bloc.dart';
import '../blocs/timer/timer_bloc.dart';
import '../widgets/game_over_dialog.dart';
import '../widgets/game_card.dart';
import '../widgets/my_button.dart';
import '../widgets/scaffold2.dart';
import '../widgets/title_widget.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        context.read<TimerBloc>().add(FinishTimer());
        context.read<GameBloc>().add(ExitGame());
      },
      child: Scaffold2(
        body: Column(
          children: [
            BlocBuilder<TimerBloc, TimerState>(
              builder: (context, state) {
                return TitleWidget(
                  play: true,
                  seconds: state is TimerStarted ? state.second : 60,
                );
              },
            ),
            Spacer(),
            SizedBox(
              width: 60 * 4 + 30,
              child: MultiBlocListener(
                listeners: [
                  BlocListener<TimerBloc, TimerState>(
                    listener: (context, state) {
                      if (state is TimerStopped) {
                        context.read<GameBloc>().add(FinishGame(win: false));
                      }
                    },
                  ),
                  BlocListener<GameBloc, GameState>(
                    listener: (context, state) {
                      if (state is GameOver) {
                        context.read<TimerBloc>().add(FinishTimer());
                        showDialog(
                          context: context,
                          barrierDismissible: false,
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
                    if (state is GamesLoaded) {
                      return Listener(
                        onPointerDown: (PointerDownEvent event) {
                          if (event.buttons == kPrimaryButton &&
                              event.device == 0) {
                            if (event.kind == PointerDeviceKind.touch &&
                                event.buttons == kPrimaryButton &&
                                event.pointer > 2) {
                              return;
                            }
                          }
                        },
                        child: Wrap(
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
                return MyButton(
                  title: state is GamesLoaded && state.started
                      ? 'RESTART'
                      : 'START',
                  onPressed: () {
                    context.read<TimerBloc>().add(StartTimer(seconds: 60));
                    context.read<GameBloc>().add(ShuffleGames(started: true));
                  },
                );
              },
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

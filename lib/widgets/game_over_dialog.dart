import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/data/data_bloc.dart';
import '../blocs/game/game_bloc.dart';
import 'my_button.dart';
import 'svg_wid.dart';

class GameOverDialog extends StatelessWidget {
  const GameOverDialog({super.key, required this.win});

  final bool win;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Dialog(
          child: Column(
            children: [
              const Spacer(),
              Text(
                win ? 'Win' : 'Lose',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'w400',
                ),
              ),
              const Spacer(),
              SvgWid(
                win ? 'assets/alien3.svg' : 'assets/alien4.svg',
                height: 300,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/coin.png',
                    height: 50,
                  ),
                  SizedBox(width: 6),
                  Text(
                    win ? '200' : '-200',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'w400',
                    ),
                  ),
                ],
              ),
              const Spacer(),
              MyButton(
                title: 'CLOSE',
                onPressed: () {
                  Navigator.pop(context);
                  context.read<GameBloc>().add(ShuffleGames(started: false));
                  context
                      .read<DataBloc>()
                      .add(AddCoins(coins: win ? 200 : -200));
                  // context.read<DataBloc>().add(AddStats(
                  //       stats: Stats(
                  //         id: getTimestamp(),
                  //         title: '',
                  //       ),
                  //     ));
                },
              ),
              SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }
}

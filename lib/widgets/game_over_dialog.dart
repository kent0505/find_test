import 'dart:ui';

import 'package:find_test/blocs/data/data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/game/game_bloc.dart';
import 'main_button.dart';
import 'svg_widget.dart';

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
              SvgWidget(
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
              MainButton(
                title: 'CLOSE',
                onPressed: () {
                  Navigator.pop(context);
                  context.read<GameBloc>().add(ShuffleGames());
                  context
                      .read<DataBloc>()
                      .add(AddCoins(coins: win ? 200 : -200));
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

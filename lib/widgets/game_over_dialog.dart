import 'dart:ui';

import 'package:find_test/blocs/game/game_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_button.dart';

class GameOverDialog extends StatelessWidget {
  const GameOverDialog({super.key, required this.win});

  final bool win;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            const Spacer(),
            Text(
              win ? 'Win' : 'Lose',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            MainButton(
              title: 'OK',
              onPressed: () {
                Navigator.pop(context);
                context.read<GameBloc>().add(ShuffleGames());
              },
            ),
            SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}

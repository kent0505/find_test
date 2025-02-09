import 'package:flutter/material.dart';

import '../core/models/game.dart';
import 'button.dart';
import 'svg_widget.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    required this.game,
    required this.canTap,
    required this.onPressed,
  });

  final Game game;
  final bool canTap;
  final void Function(Game) onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: canTap
          ? () {
              onPressed(game);
            }
          : null,
      child: Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 4,
            color: Color(0xff5D2B67).withValues(alpha: 0.5),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff585E81),
              Color(0xff5D2B67),
            ],
          ),
        ),
        child: Center(
            child: game.active
                ? SvgWidget('assets/${game.id}.svg')
                : Opacity(
                    opacity: 0.2, child: SvgWidget('assets/${game.id}.svg'))
            // : Image.asset(
            //     'assets/question.png',
            //     color: Colors.greenAccent,
            //   ),
            ),
      ),
    );
  }
}

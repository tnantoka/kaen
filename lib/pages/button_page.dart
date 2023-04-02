import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:kaen/games/button_game.dart';

class ButtonPage extends StatelessWidget {
  ButtonPage({super.key});

  final game = ButtonGame();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GameWidget<ButtonGame>(
        game: game,
        overlayBuilderMap: {'menu': (_, game) => Menu(game: game)},
      ),
    );
  }
}

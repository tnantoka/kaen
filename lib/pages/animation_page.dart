import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:kaen/games/animation_game.dart';

class AnimationPage extends StatelessWidget {
  AnimationPage({super.key});

  final game = AnimationGame();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GameWidget<AnimationGame>(
        game: game,
      ),
    );
  }
}

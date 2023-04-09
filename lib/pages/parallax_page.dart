import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:kaen/games/parallax_game.dart';

class ParallaxPage extends StatelessWidget {
  ParallaxPage({super.key});

  final game = ParallaxGame();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GameWidget<ParallaxGame>(
        game: game,
      ),
    );
  }
}

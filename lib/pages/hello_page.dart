import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:kaen/games/hello/hello_game.dart';

class HelloPage extends StatelessWidget {
  HelloPage({super.key});

  final game = HelloGame();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GameWidget(game: game),
    );
  }
}

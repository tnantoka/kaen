import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:kaen/games/physics_game.dart';

class PhysicsPage extends StatelessWidget {
  PhysicsPage({super.key});

  final game = PhysicsGame();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GameWidget(game: game),
    );
  }
}

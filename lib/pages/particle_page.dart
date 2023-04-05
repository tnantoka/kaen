import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:kaen/games/particle_game.dart';

class ParticlePage extends StatelessWidget {
  ParticlePage({super.key});

  final game = ParticleGame();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GameWidget<ParticleGame>(
        game: game,
      ),
    );
  }
}

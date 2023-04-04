import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:kaen/games/audio_game.dart';

class AudioPage extends StatelessWidget {
  AudioPage({super.key});

  final game = AudioGame();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GameWidget<AudioGame>(
        game: game,
      ),
    );
  }
}

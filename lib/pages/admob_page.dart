import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:kaen/games/admob_game.dart';

class AdmobPage extends StatelessWidget {
  AdmobPage({super.key});

  final game = AdmobGame();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GameWidget<AdmobGame>(
        game: game,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:kaen/games/acknowledgements_game.dart';

class AcknowledgementsPage extends StatelessWidget {
  AcknowledgementsPage({super.key});

  final game = AcknowledgementsGame();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GameWidget<AcknowledgementsGame>(
        game: game,
        overlayBuilderMap: {'list': (_, game) => LicenseList(game: game)},
      ),
    );
  }
}

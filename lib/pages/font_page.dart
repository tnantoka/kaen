import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:kaen/games/font_game.dart';

class FontPage extends StatefulWidget {
  const FontPage({super.key});

  @override
  State<FontPage> createState() => _FontPageState();
}

class _FontPageState extends State<FontPage> {
  FlameGame? game;

  @override
  void initState() {
    super.initState();

    setGame('first');
  }

  setGame(String screen) {
    setState(() {
      switch (screen) {
        case 'second':
          game = FontGame2(onBack: () => setGame('first'));
          break;
        default:
          game = FontGame(onNext: () => setGame('second'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GameWidget(game: game!),
    );
  }
}

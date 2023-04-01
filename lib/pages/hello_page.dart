import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class _MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await add(
      FpsTextComponent(
        position: Vector2(size.x - 8, size.y - 8),
        anchor: Anchor.bottomRight,
        textRenderer: TextPaint(style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}

class HelloPage extends StatelessWidget {
  HelloPage({super.key});

  final myGame = _MyGame();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GameWidget(game: myGame),
    );
  }
}

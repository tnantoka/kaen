import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';

class HelloGame extends FlameGame with KeyboardEvents {
  Player player = Player(x: 0.0, y: 0.0);

  @override
  Future<void> onLoad() async {
    await add(
      FpsTextComponent(
        position: Vector2(size.x - 8, size.y - 8),
        anchor: Anchor.bottomRight,
        textRenderer: TextPaint(style: const TextStyle(fontSize: 16)),
      ),
    );

    player = Player(x: size.x * 0.5, y: size.y * 0.5);
    await add(player);
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      player.vx = -1;
      return KeyEventResult.handled;
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      player.vx = 1;
      return KeyEventResult.handled;
    }

    player.vx = 0;

    return super.onKeyEvent(event, keysPressed);
  }
}

class Player extends PositionComponent {
  Player({required x, required y}) : super(position: Vector2(x, y));

  final speed = 200;
  var vx = 0;

  @override
  void update(double dt) {
    super.update(dt);

    x += vx * speed * dt;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawRect(
      const Rect.fromLTWH(0, 0, 40, 40),
      Paint()..color = Colors.white,
    );
  }
}

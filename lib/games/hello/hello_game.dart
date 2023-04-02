import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaen/games/base_game.dart';

class HelloGame extends BaseGame with KeyboardEvents {
  Player player = Player(x: 0.0, y: 0.0);

  @override
  Future<void> onLoad() async {
    grid = false;

    super.onLoad();

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

class Player extends RectangleComponent {
  Player({required x, required y})
      : super(
          position: Vector2(x, y),
          size: Vector2(40, 40),
          paint: Paint()..color = Colors.white,
        );

  final speed = 200;
  var vx = 0;

  @override
  void update(double dt) {
    super.update(dt);

    x += vx * speed * dt;
  }
}

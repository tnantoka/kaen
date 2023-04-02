import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class BaseGame extends FlameGame {
  var fps = true;
  var grid = true;

  @override
  Future<void> onLoad() async {
    if (fps) {
      await addFps();
    }
    if (grid) {
      await addGrid();
    }
  }

  Future<void> addFps() async {
    await add(
      FpsTextComponent(
        position: Vector2(size.x - 8, size.y - 8),
        anchor: Anchor.bottomRight,
        textRenderer: TextPaint(style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  Future<void> addGrid() async {
    await add(
      RectangleComponent(
        position: Vector2(size.x * 0.5, 0),
        size: Vector2(1, size.y),
        paint: Paint()..color = Colors.white,
      ),
    );
    await add(
      RectangleComponent(
        position: Vector2(0, size.y * 0.5),
        size: Vector2(size.x, 1),
        paint: Paint()..color = Colors.white,
      ),
    );
  }
}

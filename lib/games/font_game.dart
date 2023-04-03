import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:kaen/games/base_game.dart';
import 'package:flutter/material.dart';

class FontGame extends BaseGame {
  FontGame({required this.onNext});

  VoidCallback onNext;

  @override
  Future<void> onLoad() async {
    grid = false;
    super.onLoad();

    await add(
      TextComponent(
        text: 'Title',
        textRenderer: TextPaint(
          style: const TextStyle(
            fontFamily: 'DotGothic16',
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        position: Vector2(size.x * 0.5, size.y * 0.45),
        anchor: Anchor.center,
      ),
    );

    await add(
      ButtonComponent(
        position: Vector2(size.x * 0.5, size.y * 0.55),
        onPressed: () => onNext(),
        button: TextComponent(
          text: 'Next',
          textRenderer: TextPaint(
            style: const TextStyle(
              fontFamily: 'DotGothic16',
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        anchor: Anchor.center,
      ),
    );
  }
}

class FontGame2 extends BaseGame {
  FontGame2({required this.onBack});

  VoidCallback onBack;

  @override
  Future<void> onLoad() async {
    grid = false;
    super.onLoad();

    await add(
      TextComponent(
        text: 'Second',
        textRenderer: TextPaint(
          style: const TextStyle(
            fontFamily: 'DotGothic16',
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        position: Vector2(size.x * 0.5, size.y * 0.45),
        anchor: Anchor.center,
      ),
    );

    await add(
      ButtonComponent(
        position: Vector2(size.x * 0.5, size.y * 0.55),
        onPressed: () => onBack(),
        button: TextComponent(
          text: 'Back',
          textRenderer: TextPaint(
            style: const TextStyle(
              fontFamily: 'DotGothic16',
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        anchor: Anchor.center,
      ),
    );
  }
}

import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:kaen/games/base_game.dart';

class ParallaxGame extends BaseGame {
  @override
  Future<void> onLoad() async {
    grid = false;
    super.onLoad();

    final parallaxComponent = await loadParallaxComponent(
      [
        ParallaxImageData('desert-background.png'),
        ParallaxImageData('clouds-transparent.png'),
      ],
      baseVelocity: Vector2(0, -10),
      velocityMultiplierDelta: Vector2(0, 2.0),
      repeat: ImageRepeat.repeatY,
      fill: LayerFill.width,
    );
    add(parallaxComponent);
  }
}

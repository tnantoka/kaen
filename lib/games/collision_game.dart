import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:kaen/games/base_game.dart';
import 'package:flutter/material.dart';
import 'package:flame/events.dart';

class CollisionGame extends BaseGame with TapDetector, HasCollisionDetection {
  @override
  Future<void> onLoad() async {
    grid = false;
    super.onLoad();

    await add(
      Ground(x: 0.0, y: size.y, width: size.x, height: 10.0),
    );
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);

    final position = info.eventPosition.game;
    add(
      Ball(radius: 10.0, x: position.x, y: position.y),
    );
  }
}

class Ground extends RectangleComponent {
  Ground({required x, required y, required width, required height})
      : super(
          position: Vector2(x, y),
          size: Vector2(width, height),
          paint: Paint()..color = Colors.white,
          anchor: Anchor.bottomLeft,
        );

  @override
  FutureOr<void> onLoad() {
    add(RectangleHitbox());
    return super.onLoad();
  }
}

class Ball extends CircleComponent with CollisionCallbacks {
  Ball({required x, required y, required radius})
      : super(
          position: Vector2(x, y),
          radius: radius,
          paint: Paint()..color = Colors.white,
        );

  var vy = 2.0;

  @override
  Future<void> onLoad() {
    add(CircleHitbox());
    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is Ground || other is Ball) {
      vy = 0;
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    y += vy;
  }
}

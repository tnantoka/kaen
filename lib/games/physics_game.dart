import 'dart:async';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class PhysicsGame extends Forge2DGame with TapDetector {
  @override
  Future<void> onLoad() async {
    final screen = screenToWorld(camera.viewport.effectiveSize);
    add(Wall(position: Vector2(0, screen.y), size: Size(screen.x, 1)));
    add(Wall(position: Vector2(0, 0), size: Size(1, screen.y)));
    add(Wall(position: Vector2(screen.x, 0), size: Size(1, screen.y)));

    return super.onLoad();
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);

    final position = info.eventPosition.game;
    add(Ball(radius: 2, position: position));
  }
}

class Ball extends BodyComponent {
  Ball({required this.radius, required this.position})
      : super(paint: Paint()..color = Colors.cyan);

  final double radius;
  final Vector2 position;

  @override
  Body createBody() {
    final shape = CircleShape()..radius = radius;

    final fixtureDef = FixtureDef(
      shape,
      restitution: 0.8,
      density: 1.0,
      friction: 0.4,
    );

    final bodyDef = BodyDef(
      userData: this,
      angularDamping: 0.8,
      position: position,
      type: BodyType.dynamic,
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}

class Wall extends BodyComponent {
  Wall({required this.position, required this.size})
      : super(paint: Paint()..color = Colors.orange);

  final Vector2 position;
  final Size size;

  @override
  Body createBody() {
    final shape = PolygonShape()..setAsBoxXY(size.width, size.height);
    final fixtureDef = FixtureDef(shape, friction: 0.3);
    final bodyDef = BodyDef(
      userData: this,
      position: position,
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}

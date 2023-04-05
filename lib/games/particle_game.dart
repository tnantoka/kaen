import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import 'package:kaen/games/base_game.dart';

class ParticleGame extends BaseGame with TapDetector {
  final random = Random();
  final colorTween = ColorTween(begin: Colors.red, end: Colors.orange);

  @override
  Future<void> onLoad() async {
    grid = false;
    super.onLoad();
  }

  @override
  void onTapDown(TapDownInfo info) {
    add(
      ParticleSystemComponent(
        position: info.eventPosition.game,
        particle: Particle.generate(
          count: 120,
          generator: (i) {
            return AcceleratedParticle(
              speed: Vector2(
                    random.nextDouble() * 2 - 1,
                    random.nextDouble() * 2 - 1,
                  ) *
                  i.toDouble(),
              child: CircleParticle(
                radius: random.nextDouble() * 8,
                paint: Paint()
                  ..color = colorTween
                      .transform(random.nextDouble())!
                      .withAlpha(random.nextInt(160)),
              ),
            );
          },
        ),
      ),
    );
  }
}

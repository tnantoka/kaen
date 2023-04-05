import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

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
          count: 96,
          generator: (i) {
            final size = 4 + random.nextDouble() * 12;
            final color = colorTween
                .transform(random.nextDouble())!
                .withAlpha(random.nextInt(160));
            return AcceleratedParticle(
              speed: Vector2(
                    random.nextDouble() * 2 - 1,
                    random.nextDouble() * 2 - 1,
                  ) *
                  i.toDouble(),
              child: ImageParticle(
                size: Vector2.all(size),
                image: createColorImage(color, size),
              ),
            );
          },
        ),
      ),
    );
  }

  ui.Image createColorImage(Color color, double size) {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final paint = Paint()..color = color;
    final rect = Rect.fromLTWH(0, 0, size, size);
    canvas.drawRect(rect, paint);

    final picture = recorder.endRecording();
    final image = picture.toImageSync(size.toInt(), size.toInt());

    return image;
  }
}

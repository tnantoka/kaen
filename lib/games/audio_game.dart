import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:kaen/games/base_game.dart';

class AudioGame extends BaseGame {
  @override
  Future<void> onLoad() async {
    grid = false;
    super.onLoad();

    await add(
      ButtonComponent(
        position: Vector2(100, 100),
        onPressed: () {
          if (FlameAudio.bgm.isPlaying) {
            FlameAudio.bgm.stop();
          } else {
            FlameAudio.bgm.play('space-asteroids.mp3');
          }
        },
        button: TextComponent(
          text: 'BGM',
        ),
      ),
    );

    await add(
      ButtonComponent(
        position: Vector2(200, 100),
        onPressed: () {
          FlameAudio.play('explosion.wav');
        },
        button: TextComponent(
          text: 'SE',
        ),
      ),
    );
  }
}

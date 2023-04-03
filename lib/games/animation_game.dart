import 'dart:async';

import 'package:flame/components.dart';
import 'package:kaen/games/base_game.dart';

class AnimationGame extends BaseGame {
  @override
  Future<void> onLoad() async {
    grid = false;
    super.onLoad();

    final size = Vector2(58, 72);
    final data = SpriteAnimationData.sequenced(
      textureSize: size,
      amount: 6,
      stepTime: 0.1,
    );
    await add(
      SpriteAnimationComponent.fromFrameData(
        await images.load('Fiyah.png'),
        data,
        position: Vector2(100, 100),
      ),
    );
  }
}

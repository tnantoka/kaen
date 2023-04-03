import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:kaen/games/base_game.dart';

class ButtonGame extends BaseGame {
  var result = TextComponent();
  var status = '';

  @override
  Future<void> onLoad() async {
    fps = false;
    super.onLoad();

    await add(
      ButtonComponent(
        position: Vector2(size.x * 0.5, size.y * 0.5),
        onPressed: () => overlays.add('menu'),
        button: TextComponent(
          text: 'Button',
        ),
        anchor: Anchor.center,
      ),
    );

    result = TextComponent(
      text: '',
      position: Vector2(size.x * 0.5, size.y * 0.6),
      anchor: Anchor.center,
    );
    await add(result);
  }

  @override
  void update(double dt) {
    super.update(dt);

    result.text = status;
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key, required this.game});

  final ButtonGame game;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Menu'),
      children: ['OK', 'Cancel']
          .map(
            (status) => SimpleDialogOption(
              child: Text(status),
              onPressed: () {
                game.status = status;
                game.overlays.remove('menu');
              },
            ),
          )
          .toList(),
    );
  }
}

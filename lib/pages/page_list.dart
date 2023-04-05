import 'package:flutter/material.dart';

class PageList extends StatelessWidget {
  const PageList({required this.selected, super.key});

  static const pages = [
    ['', ''],
    ['hello', 'Rectangle, Keyboard'],
    ['button', 'Button, Overlays'],
    ['physics', 'Forge2D, TapDetector'],
    ['font', 'Google Fonts, Screens'],
    ['animation', 'SpriteAnimationComponent'],
    ['collision', 'HasCollisionDetection, CollisionCallbacks'],
    ['audio', 'FlameAudio'],
    [
      'particle',
      'ParticleSystemComponent, AcceleratedParticle, CircleParticle'
    ],
  ];

  final String selected;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final page in pages)
          ListTile(
            title: Text(page[0] == '' ? 'home' : page[0]),
            subtitle: Text(page[1]),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/${page[0]}');
            },
            selected: page[0] == selected,
          ),
      ],
    );
  }
}

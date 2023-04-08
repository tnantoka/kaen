import 'package:flutter/material.dart';

class PageList extends StatelessWidget {
  const PageList({required this.selected, super.key});

  static const pages = [
    ['', ''],
    ['hello', 'Rectangle, Keyboard'],
    ['button', 'Button, Overlays'],
    ['physics', 'flame_forge2d, TapDetector'],
    ['font', 'Google Fonts, Screens'],
    ['animation', 'SpriteAnimationComponent'],
    ['collision', 'HasCollisionDetection, CollisionCallbacks'],
    ['audio', 'flame_audio'],
    ['particle', 'ParticleSystemComponent, AcceleratedParticle, ImageParticle'],
    ['admob', 'google_mobile_ads'],
    ['acknowledgements', 'showAboutDialog, LicenseRegistry'],
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

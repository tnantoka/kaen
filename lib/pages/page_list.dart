import 'package:flutter/material.dart';

class PageList extends StatelessWidget {
  const PageList({required this.selected, super.key});

  static const pages = [
    ['', ''],
    ['hello', 'Rectangle, Keyboard'],
    ['button', 'Button, Overlays'],
    ['physics', 'Forge2D'],
    ['font', 'Google Fonts'],
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
              Navigator.pushNamed(context, '/${page[0]}');
            },
            selected: page[0] == selected,
          ),
      ],
    );
  }
}

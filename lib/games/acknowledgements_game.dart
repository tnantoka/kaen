import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kaen/games/base_game.dart';

class AcknowledgementsGame extends BaseGame {
  @override
  Future<void> onLoad() async {
    grid = false;
    super.onLoad();

    await add(
      ButtonComponent(
        position: Vector2(size.x * 0.5, size.y * 0.4),
        onPressed: () => showAboutDialog(context: buildContext!),
        button: TextComponent(
          text: 'About',
        ),
        anchor: Anchor.center,
      ),
    );

    await add(
      ButtonComponent(
        position: Vector2(size.x * 0.5, size.y * 0.6),
        onPressed: () => overlays.add('list'),
        button: TextComponent(
          text: 'List',
        ),
        anchor: Anchor.center,
      ),
    );
  }
}

class LicenseList extends StatefulWidget {
  const LicenseList({super.key, required this.game});

  final AcknowledgementsGame game;

  @override
  State<LicenseList> createState() => _LicenseListState();
}

class _LicenseListState extends State<LicenseList> {
  var licenses = <LicenseEntry>[];

  @override
  void initState() {
    super.initState();

    LicenseRegistry.licenses.listen((entry) {
      setState(() {
        licenses.add(entry);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
      fontFamily: 'DotGothic16',
      color: Colors.white,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Licenses', style: textStyle),
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.close),
            onPressed: () => widget.game.overlays.remove('list'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: licenses.length,
        itemBuilder: (context, index) {
          final entry = licenses[index];
          return ExpansionTile(
            collapsedIconColor: Colors.white,
            iconColor: Colors.white,
            title: Text(entry.packages.join(', '), style: textStyle),
            children: [
              Text(entry.paragraphs.map((p) => p.text).join('\n'),
                  style: textStyle),
            ],
          );
        },
      ),
    );
  }
}

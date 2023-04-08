import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kaen/pages/animation_page.dart';
import 'package:kaen/pages/audio_page.dart';
import 'package:kaen/pages/button_page.dart';
import 'package:kaen/pages/collision_page.dart';
import 'package:kaen/pages/font_page.dart';
import 'package:kaen/pages/home_page.dart';
import 'package:kaen/pages/hello_page.dart';
import 'package:kaen/pages/physics_page.dart';
import 'package:kaen/pages/particle_page.dart';
import 'package:kaen/pages/admob_page.dart';
import 'package:kaen/pages/acknowledgements_page.dart';
import 'package:kaen/pages/page_list.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && Platform.isIOS) {
    MobileAds.instance.initialize();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaen',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
      ),
      initialRoute: '/',
      routes: Map.fromEntries(
        PageList.pages.map(
          (page) => MapEntry(
            '/${page[0]}',
            (context) => MyHomePage(route: page[0]),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.route, super.key});

  final String route;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.route),
          actions: [
            IconButton(
              icon: const Icon(Icons.code),
              tooltip: 'GitHub',
              onPressed: () => launchGitHub(),
            ),
          ],
        ),
        drawer: Drawer(
          child: PageList(selected: widget.route),
        ),
        body: Container(
          color: Colors.blueGrey.shade50,
          child: page(widget.route),
        ),
      );
    });
  }

  launchGitHub() {
    final path =
        widget.route == '' ? 'pages/home_page' : 'games/${widget.route}_game';
    final url = 'https://github.com/tnantoka/kaen/blob/main/lib/$path.dart';
    launchUrl(Uri.parse(url));
  }

  Widget page(route) {
    switch (route) {
      case '':
        return const HomePage();
      case 'hello':
        return HelloPage();
      case 'button':
        return ButtonPage();
      case 'physics':
        return PhysicsPage();
      case 'font':
        return const FontPage();
      case 'animation':
        return AnimationPage();
      case 'collision':
        return CollisionPage();
      case 'audio':
        return AudioPage();
      case 'particle':
        return ParticlePage();
      case 'admob':
        return AdmobPage();
      case 'acknowledgements':
        return AcknowledgementsPage();
      default:
        throw UnimplementedError('no widget for $route');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:kaen/pages/button_page.dart';

import 'package:kaen/pages/home_page.dart';
import 'package:kaen/pages/hello_page.dart';

void main() {
  runApp(const MyApp());
}

const pages = [
  ['', ''],
  ['hello', 'Rectangle, Keyboard'],
  ['button', 'Button, Overlays'],
];

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
        pages.map(
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
    Widget page;
    switch (widget.route) {
      case '':
        page = const HomePage();
        break;
      case 'hello':
        page = HelloPage();
        break;
      case 'button':
        page = ButtonPage();
        break;
      default:
        throw UnimplementedError('no widget for $this.route');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.route),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              for (final page in pages)
                ListTile(
                  title: Text(page[0] == '' ? 'home' : page[0]),
                  subtitle: Text(page[1]),
                  onTap: () {
                    Navigator.pushNamed(context, '/${page[0]}');
                  },
                  selected: page[0] == widget.route,
                ),
            ],
          ),
        ),
        body: Container(
          color: Colors.blueGrey.shade50,
          child: page,
        ),
      );
    });
  }
}

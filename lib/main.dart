import 'package:flutter/material.dart';

import 'package:kaen/pages/hello_page.dart';
import 'package:kaen/pages/template_page.dart';

void main() {
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedPage = 'Hello';

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedPage) {
      case 'Hello':
        page = HelloPage();
        break;
      case 'Template':
        page = const TemplatePage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedPage');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text(selectedPage),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              for (final page in ['Hello', 'Template'])
                ListTile(
                  title: Text(page),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      selectedPage = page;
                    });
                  },
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

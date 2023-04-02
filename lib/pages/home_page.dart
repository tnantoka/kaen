import 'package:flutter/material.dart';
import 'package:kaen/pages/page_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: PageList(selected: ''),
    );
  }
}

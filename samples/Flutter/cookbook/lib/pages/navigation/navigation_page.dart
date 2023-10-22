import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigation'),),
      body: Column(
        children: [
          Expanded(
            child: Text('Top'),
          ),
          Expanded(child: Text('Bottom')),
        ],
      ),
    );
  }
}
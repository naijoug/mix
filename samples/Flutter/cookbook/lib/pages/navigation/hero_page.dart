import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const HeroDetailPage();
          }));
        },
        child: Hero(tag: 'imageHero', child: Image.network(
          'https://picsum.photos/250?image=9',
        ),),
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  const HeroDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(tag: 'imageHero', child: Center(
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),),
      ),
    );
  }
}
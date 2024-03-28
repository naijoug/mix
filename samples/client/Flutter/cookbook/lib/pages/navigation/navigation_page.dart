import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: TextButton(child: const Text('detail'), onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const NavigationDetailPage()));
          },),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: ElevatedButton(child: const Text('route page'), onPressed: () {
              Navigator.of(context)
                  .pushNamed('/route', arguments: 'route params');
            },),),
          )
        ],
      ),
    );
  }
}

class NavigationDetailPage extends StatelessWidget {
  const NavigationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation detail.'),),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),
      ),
    );
  }
}
import 'package:cookbook/pages/navigation/route_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cookbook',
      // home: const HomePage(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_train)),
              Tab(icon: Icon(Icons.directions_bike)),
            ]),
            title: const Text('cookbook'),
          ),
          body: const TabBarView(children: [
            HomePage(),
            Text('train'),
            Text('bike'),
          ]),
        ),
      ),
      routes: {'/route': (context) => const RoutePage()},
    );
  }
}

import 'package:flutter/material.dart';

// Reference: [Flutter - 不听话的 Container](https://juejin.cn/post/7044838661635964965)

class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => _ContainerTest1()));
              },
              child: const Text('test 1')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => _ContainerTest2()));
              },
              child: const Text('test 2')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => _ContainerTest3()));
              },
              child: const Text('test 3')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const _ContainerTest4()));
              },
              child: const Text('test 4')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const _ContainerTest5()));
              },
              child: const Text('test 5')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const _ContainerTest6()));
              },
              child: const Text('test 6')),
        ],
      ),
    );
  }
}

class _ContainerTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Container 1'),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}

class _ContainerTest2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Container 2'),
      ),
      body: Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
    );
  }
}

class _ContainerTest3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Container 3'),
      ),
      // body: Container(
      //   width: 100,
      //   height: 100,
      //   color: Colors.red,
      //   alignment: Alignment.center,
      // ),
      body: Container(
          width: 100,
          height: 100,
          color: Colors.red,
          alignment: Alignment.center,
          child: Container(
            width: 10,
            height: 10,
            color: Colors.blue,
          ),
        ),
    );
  }
}

class _ContainerTest4 extends StatelessWidget {
  const _ContainerTest4();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Container 4'),
      ),
      body: Center(
        child: Container(
          color: Colors.red,
          width: 200,
        ),
      ),
    );
  }
}

class _ContainerTest5 extends StatelessWidget {
  const _ContainerTest5();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Container 5'),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Container(
              color: Colors.red,
              child: const Text(
                '我是一段很长很长很长的文字',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              color: Colors.red,
              child: const Text('我是一段很短的文字'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContainerTest6 extends StatelessWidget {
  const _ContainerTest6();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Container'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 400,
            minHeight: 300,
            minWidth: 300,
            maxWidth: 400,
          ),
          color: Colors.red,
          width: 200,
        ),
      ),
    );
  }
}

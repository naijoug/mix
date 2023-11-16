import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LifecyclePage extends StatelessWidget with WidgetsBindingObserver {
  const LifecyclePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('root build...');
    return Scaffold(
      appBar: AppBar(title: const Text('Lifecycle'),),
      body: const FatherCounter(),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('lifecycle didChangeAppLifecycleState $state');
  }
  @override
  void didChangeAccessibilityFeatures() {
    super.didChangeAccessibilityFeatures();
    print('lifecycle didChangeAccessibilityFeatures');
  }
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    print('lifecycle didChangeMetrics');
  }
}

class FatherCounter extends StatefulWidget {
  const FatherCounter({super.key});

  @override
  State<FatherCounter> createState() {
    print('father createState');
    return _FatherCounterState();
  }
}

class _FatherCounterState extends State<FatherCounter> {
  late int _count;

  @override
  void initState() {
    super.initState();
    print('father initState');
    _count = 0;

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      print('father addPostFrameCallback. $timeStamp');
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('father didChangeDependencies.');
  }

  @override
  void didUpdateWidget(covariant FatherCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('father didUpdateWidget');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }

  @override
  void activate() {
    super.activate();
    print('father activate.');
  }
  @override
  void deactivate() {
    super.deactivate();
    print('father deactivate.');
  }

  @override
  void dispose() {
    super.dispose();
    print('father dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('father build...');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
            Expanded(child: Text('father count: $_count')),
            ElevatedButton(onPressed: () {
              _counter();
            }, child: const Text('tap father!')),
          ],),
          const SonCounter(),
        ],
      ),
    );
  }

  void _counter() {
    print('father setState');
    setState(() {
      _count += 1;
    });
  }
}

class SonCounter extends StatefulWidget {
  const SonCounter({super.key});

  @override
  State<SonCounter> createState() {
    print('son createState');
    return _SonCounterState();
  }
}

class _SonCounterState extends State<SonCounter> {
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = 0;
    print('son initState');

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      print('son addPostFrameCallback $timeStamp');
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('son didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant SonCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('son didUpdateWidget');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('son reassemble');
  }

  @override
  void dispose() {
    super.dispose();
    print('son dispose');
  }

  @override
  void activate() {
    super.activate();
    print('son activate');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('son deactivate');
  }

  @override
  Widget build(BuildContext context) {
    print('son build');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text('count: $_count'),
        ),
        Container(
          color: Colors.green,
          child: Text('count: $_count'),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.blue,
          child: GestureDetector(
            child: const Text('tap me'),
            onTap: () {
              _counter();
            },
          ),
        ),
      ],
    );
  }

  void _counter() {
    print('son setState');
    setState(() {
      _count += 1;
    });
  }
}

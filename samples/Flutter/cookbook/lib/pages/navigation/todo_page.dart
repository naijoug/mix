import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String detail;

  const Todo(this.title, this.detail);
}

class TodoPage extends StatelessWidget {
  TodoPage({super.key});

  final items = List.generate(
    100,
    (index) => Todo('$index - todo', 'This is todo detail $index.'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('todo'),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.check_box_outline_blank),
              title: Text(items[index].title),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => TodoDetailPage(todo: items[index])));
              },
            );
          }),
    );
  }
}

class TodoDetailPage extends StatelessWidget {
  final Todo todo;
  const TodoDetailPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(todo.detail),
          ),
          const SizedBox(height: 10,),
          Center(
            child: ElevatedButton(child: const Text('detail'), onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const TodoRouteDetailPage(), settings: RouteSettings(arguments: todo),));
            },),
          ),
          const SizedBox(height: 50,),
          Center(
            child: SelectionButton(todo: todo,),
          ),
          const SizedBox(height: 20,),
          TextButton(onPressed: () {
            Navigator.of(context).pop(todo.detail);
          }, child: Text('back ${todo.detail}'))
        ],
      )
    );
  }
}

class TodoRouteDetailPage extends StatelessWidget {
  const TodoRouteDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)?.settings.arguments as Todo;

    return Scaffold(
      appBar: AppBar(title: Text('Route setting ${todo.title}.'),),
      body: Column(
        children: [
          Center(child: Text(todo.detail),)
        ],
      ),
    );
  }
}

class SelectionButton extends StatefulWidget {
  final Todo todo;
  const SelectionButton({super.key, required this.todo});

  @override
  State<StatefulWidget> createState() {
    return _SelectionButtonState();
  }
}

class _SelectionButtonState extends State<SelectionButton> {
  late ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Tap me!'),
      onPressed: () {
        _navAndCallback(context);
      },
    );
  }

  _navAndCallback(BuildContext context) async {
    final result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => TodoDetailPage(todo: widget.todo)));
    if (!mounted) { return; }
    ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(result)));
  }
}
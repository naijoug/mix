import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autofocus: true,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'input something!',
                labelText: 'text field',
              ),
              onChanged: (text) {
                print('text field input $text');
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'form input something!',
                  labelText: 'form field'),
              onChanged: (text) {
                print('form input $text');
              },
            ),
          ),
          const SizedBox(height: 20),
          const MyCustomField(),
        ],
      ),
    );
  }
}

class MyCustomField extends StatefulWidget {
  const MyCustomField({super.key});

  @override
  State<StatefulWidget> createState() => _MyCustomFieldState();
}

class _MyCustomFieldState extends State<MyCustomField> {
  String _text = '';
  final _controller = TextEditingController();
  late FocusNode _node;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      print('custom input ${_controller.text}');
      _text = _controller.text;
      setState(() {});
    });
    _node = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _node.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'custom input: $_text',
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller,
                  focusNode: _node,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'input custom field',
                    labelText: 'custom field',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(_controller.text),
                      );
                    });
              },
              child: const Text('alter'),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            _node.requestFocus();
          },
          child: const Text('fouce'),
        ),
        Form(
          key: _formKey,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'form input...',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please input something!';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('msg...'),
                    ),
                  );
                }
              },
              child: const Text('submit'),
            )
          ],),
        )
      ],
    );
  }
}

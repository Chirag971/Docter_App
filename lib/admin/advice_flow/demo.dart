import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      body: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.subscript),
            onPressed: () {
              
            },
          ),
          Container(),
        ],
      ),
    );
  }
}

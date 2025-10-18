import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Page')),
      body: Column(
        children: [
          Text('This is a test page'),

          IconButton(onPressed: () {}, icon: Icon(Icons.safety_check)),
        ],
      ),
    );
  }
}

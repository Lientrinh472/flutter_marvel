import 'package:flutter/material.dart';
import 'package:marvel_table/views/home_page.dart';


void main() {
  runApp(const MaterialApp(
    home: HomePage(title: 'Navigation Basics',),
  ));
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
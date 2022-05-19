import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animais',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Animais'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _action = '';
  final List<Animal> _animal = [
    Dog(),
    Cat(),
  ];

  void _talk() {
    setState(() {
      _action = _animal[Random().nextInt(_animal.length)].talk();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'O animal diz:',
            ),
            Text(
              _action,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: _talk,
          tooltip: 'Talk',
          child: const Icon(Icons.campaign),
        ),
      ]),
    );
  }
}

abstract class Animal {
  String talk();
  String walk();
}

class Dog implements Animal {
  @override
  String talk() {
    print('Au au!');
    return 'Au au!';
  }

  @override
  String walk() {
    print('I\'m walking');
    return 'I\'m walking';
  }
}

class Cat implements Animal {
  @override
  String talk() {
    print('Miau miau!');
    return 'Miau miau!';
  }

  @override
  String walk() {
    print('I\'m walking');
    return 'I\'m walking';
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'o7planning',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter SnackBar Example'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: Center(
        child: Builder(builder: (BuildContext ctxOfScaffold) {
          return ElevatedButton(
            child: const Text('Show SnackBar'),
            onPressed: () {
              _showSnackBarMsgDeleted(ctxOfScaffold);
            },
          );
        }),
      ),
    );
  }

  void _showSnackBarMsgDeleted(BuildContext ctxOfScaffold) {
    // Create a SnackBar.
    final snackBar = SnackBar(
      content: const Text('Message is deleted!'),
      action: SnackBarAction(
        label: 'UNDO',
        onPressed: () {
          _showSnackBarMsgRestored(ctxOfScaffold);
        },
      ),
    );
    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(ctxOfScaffold).showSnackBar(snackBar);
  }

  void _showSnackBarMsgRestored(BuildContext ctxOfScaffold) {
    // Create a SnackBar.
    const snackBar = SnackBar(content: Text('Message is restored!'));
    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(ctxOfScaffold).showSnackBar(snackBar);
  }
}

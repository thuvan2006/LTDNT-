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
  int pressedCount = 0; // Khai báo và khởi tạo pressedCount
  int longPressCount = 0; // Khai báo và khởi tạo longPressCount

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_interpolation_to_compose_strings
        title: Text("Pressed: $pressedCount --- Long Press: $longPressCount"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: onPressHandler,
          onLongPress: onLongPressHandler,
          child: const Text("Test Me"),
        ),
      ),
    );
  }

  void onPressHandler() {
    setState(() {
      pressedCount++;
    });

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Message"),
        content: const Text("OK, You just Pressed!"),
        actions: <Widget>[
          TextButton(
            child: const Text('Close me!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  void onLongPressHandler() {
    setState(() {
      longPressCount++;
    });

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Message"),
        content: const Text("Hey, I show up for long press"),
        actions: <Widget>[
          TextButton(
            child: const Text('Close me!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}

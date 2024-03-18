import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title of Application',
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
    double maxSize = 96;
    double leftPadding = 30;

    return Scaffold(
      appBar: AppBar(
        title: const Text("IconButton Example"),
      ),
      body: Center(
        child: Column(
          children: [
            getIconButton(
                maxSize,
                leftPadding,
                "https://raw.githubusercontent.com/o7planning/rs/master/flutter/feel_good_96.png",
                "Real Size: 96"),
            getIconButton(
                maxSize,
                leftPadding,
                "https://raw.githubusercontent.com/o7planning/rs/master/flutter/feel_good_72.png",
                "Real Size: 72"),
            getIconButton(
                maxSize,
                leftPadding,
                "https://raw.githubusercontent.com/o7planning/rs/master/flutter/feel_good_24.png",
                "Real Size: 24"),
          ],
        ),
      ),
    );
  }

  Widget getIconButton(
      double iconSize, double leftPadding, String imageUrl, String labelText) {
    return Row(
      children: [
        SizedBox(width: leftPadding),
        IconButton(
          icon: Image.network(imageUrl),
          onPressed: () {
            if (kDebugMode) {
              print("Pressed");
            }
          },
          iconSize: iconSize,
        ),
        const SizedBox(width: 8),
        Text(labelText),
        const SizedBox(width: 8),
        Text("Set iconSize: $iconSize"),
      ],
    );
  }
}

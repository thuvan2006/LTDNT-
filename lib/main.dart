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
      title: 'o7planning.org',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  // String imageUrl = "https://s3.o7planning.com/images/boy-128.png";
  String imageUrl = "https://file-not-found";
  bool _loadImageError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Flutter CircleAvatar Example")),
        body: Center(
            child: CircleAvatar(
                radius: 100,
                backgroundImage:
                    _loadImageError ? null : NetworkImage(imageUrl),
                onBackgroundImageError: _loadImageError
                    ? null
                    : (Object exception, StackTrace? stackTrace) {
                        if (kDebugMode) {
                          print("Error loading image! $exception");
                        }
                        setState(() {
                          _loadImageError = true;
                        });
                      },
                child: _loadImageError
                    ? const Text("Error loading image!")
                    : null)));
  }
}

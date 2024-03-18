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
      appBar: AppBar(title: const Text("Flutter AlertDialog Example")),
      body: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          child: const Text("Open Dialog"),
          onPressed: () {
            showMyAlertDialog(context);
          },
        ),
      ])),
    );
  }

  void showMyAlertDialog(BuildContext context) {
    // Create a AlertDialog.
    AlertDialog dialog = AlertDialog(
      title: const Text("Confirm"),
      content: const Text("Are you sure to remove this item?"),
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.green, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      actions: [
        ElevatedButton(
            child: const Text("Yes Delete"),
            onPressed: () {
              Navigator.of(context).pop(true); // Return true
            }),
        ElevatedButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop(false); // Return false
            }),
      ],
    );

    // Call showDialog function.
    Future futureValue = showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
    futureValue.then((value) {
      if (kDebugMode) {
        if (kDebugMode) {
          if (kDebugMode) {
            if (kDebugMode) {
              print("Return value: $value");
            }
          }
        }
      } // true/false
    });
  }
}

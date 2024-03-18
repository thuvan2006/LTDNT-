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
  ProgrammingLanguage selectedLanguage = ProgrammingLanguage('', 0.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter SimpleDialog Example")),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            ElevatedButton(
              child: const Text("Select a Language"),
              onPressed: () {
                showMyAlertDialog(context);
              },
            ),
            const SizedBox(width: 5, height: 5),
            // ignore: unnecessary_null_comparison
            Text(
                // ignore: unnecessary_null_comparison
                "Selected Language: ${selectedLanguage == null ? '?' : selectedLanguage.name}")
          ])),
    );
  }

  showMyAlertDialog(BuildContext context) {
    var javascript = ProgrammingLanguage("Javascript", 67.7);
    var htmlCss = ProgrammingLanguage("HTML/CSS", 63.1);
    var sql = ProgrammingLanguage("SQL", 57.4);

    // Create SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      title: const Text('Select a Language:'),
      children: <Widget>[
        SimpleDialogOption(
            onPressed: () {
              // Close and return value
              Navigator.pop(context, javascript);
            },
            child: Text(javascript.name)),
        SimpleDialogOption(
          onPressed: () {
            // Close and return value
            Navigator.pop(context, htmlCss);
          },
          child: Text(htmlCss.name),
        ),
        SimpleDialogOption(
          onPressed: () {
            // Close and return value
            Navigator.pop(context, sql);
          },
          child: Text(sql.name),
        )
      ],
    );

    // Call showDialog function to show dialog.
    Future futureValue = showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });

    futureValue.then((language) => {
          setState(() {
            selectedLanguage = language;
          })
        });
  }
}

class ProgrammingLanguage {
  String name;
  double percent;

  ProgrammingLanguage(this.name, this.percent);
}

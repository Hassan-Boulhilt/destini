import 'package:flutter/material.dart';

import 'storybrain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destini',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Destini'),
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
  StoryBrain storybrain = StoryBrain();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: storybrain.buttonShouldBeVisible() == false ? 6 : 5,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      storybrain.getStory(),
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red[600],
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                    onPressed: () {
                      setState(() {
                        storybrain.nextStory(1);
                      });
                    },
                    child: Text(
                      storybrain.getChoice1(),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: storybrain.buttonShouldBeVisible(),
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue[600],
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero)),
                      onPressed: () {
                        setState(() {
                          storybrain.nextStory(2);
                        });
                      },
                      child: Text(
                        storybrain.getChoice2(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

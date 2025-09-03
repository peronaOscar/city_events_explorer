import 'package:flutter/material.dart';

class EventExplorerApp extends StatelessWidget {
  const EventExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Events Explorer',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text("TO DO"),
        ),
      ),
    );
  }
}

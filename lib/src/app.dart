import 'package:city_events_explorer/src/data/datasources/events_json_manager.dart';
import 'package:flutter/material.dart';

class EventExplorerApp extends StatelessWidget {
  const EventExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Events Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: Scaffold(),
    );
  }
}
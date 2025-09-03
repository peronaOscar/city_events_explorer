import 'package:city_events_explorer/src/presentation/screens/home/widgets/event_list_page.dart';
import 'package:city_events_explorer/src/presentation/screens/home/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "City Events Explorer",
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomeHeader(),
          Expanded(
            child: EventListPage(),
          )
        ],
      ),

    );
  }
}

import 'package:city_events_explorer/src/config/theme/colors.dart';
import 'package:city_events_explorer/src/presentation/blocs/events/events_bloc.dart';
import 'package:city_events_explorer/src/presentation/blocs/events/events_events.dart';
import 'package:city_events_explorer/src/presentation/blocs/filters/filters_bloc.dart';
import 'package:city_events_explorer/src/presentation/blocs/filters/filters_events.dart';
import 'package:city_events_explorer/src/presentation/screens/home/widgets/event_list_page.dart';
import 'package:city_events_explorer/src/presentation/screens/home/widgets/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        title: const Text("City Events Explorer"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<FiltersBloc>().add(DeleteFilters());
                context.read<EventsBloc>().add(FetchEvents(1));
              },
              icon: const Icon(Icons.close, color: AppColors.surface,)
          )
        ],
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomeHeader(),
          Expanded(child: EventListPage()),
        ],
      ),
    );
  }
}

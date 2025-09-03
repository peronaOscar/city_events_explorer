import 'package:city_events_explorer/src/config/theme/colors.dart';
import 'package:city_events_explorer/src/data/models/category_model.dart';
import 'package:city_events_explorer/src/data/models/event_model.dart';
import 'package:city_events_explorer/src/data/models/location_model.dart';
import 'package:city_events_explorer/src/presentation/widgets/card/event_card.dart';
import 'package:flutter/material.dart';

class EventListPage extends StatefulWidget {
  const EventListPage({super.key});

  @override
  State<EventListPage> createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  final ScrollController _scrollController = ScrollController();
  List<EventModel> events = [];
  bool isLoading = false;
  int page = 0;
  final int pageSize = 20;

  @override
  void initState() {
    super.initState();
    _loadMoreEvents();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200 &&
          !isLoading) {
        _loadMoreEvents();
      }
    });
  }

  Future<void> _loadMoreEvents() async {
    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 1));

    List<EventModel> newEvents = List.generate(
      pageSize,
          (index) => EventModel(
            id: 99,
            category: EventCategoryModel(id: 1, name: "Example"),
            description: "Community BBQ - A special event you shouldn't miss.",
            endDate: "2025-08-20T18:00:00Z",
            startDate: "2025-08-20T20:00:00Z",
            imageUrl: "https://picsum.photos/500",
            title: "Lorem impsum",
            location: LocationModel(
              name: "Central Park Great Lawn",
              lat: 40.7828647,
              lng: -73.9653551
            )
          ),
    );

    setState(() {
      events.addAll(newEvents);
      page++;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        itemCount: events.length + (isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < events.length) {
            return EventCard(event: events[index],);
          } else {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator(color: AppColors.primaryDark,)),
            );
          }
        },
      ),
    );
  }
}

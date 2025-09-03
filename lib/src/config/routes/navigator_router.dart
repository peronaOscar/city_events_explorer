import 'package:city_events_explorer/src/config/routes/navigator_routes.dart';
import 'package:city_events_explorer/src/data/models/event_model.dart';
import 'package:city_events_explorer/src/presentation/screens/event_detail/event_detail_screen.dart';
import 'package:city_events_explorer/src/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch(settings.name) {

    case NavigatorRoutes.home:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );

    case NavigatorRoutes.detail:

      final args = settings.arguments as EventModel;

      return MaterialPageRoute(
        builder: (context) {
          return EventDetailScreen(event: args);
        },
      );

    }
    return null;
  }
}
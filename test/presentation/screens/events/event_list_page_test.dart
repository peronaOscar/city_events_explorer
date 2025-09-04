import 'package:city_events_explorer/src/domain/entities/category.dart';
import 'package:city_events_explorer/src/domain/entities/event.dart';
import 'package:city_events_explorer/src/domain/entities/location.dart';
import 'package:city_events_explorer/src/domain/repositories/event_repository.dart';
import 'package:city_events_explorer/src/presentation/blocs/events/events_bloc.dart';
import 'package:city_events_explorer/src/presentation/blocs/events/events_events.dart';
import 'package:city_events_explorer/src/presentation/blocs/filters/filters_bloc.dart';
import 'package:city_events_explorer/src/presentation/screens/home/widgets/event_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeRepo implements EventRepository {
  @override
  Future<List<Event>> getEventsFiltered({
    int? categoryId,
    String? startDate,
    String? endDate,
    String? searchValue,
    required int page,
  }) async {
    return [
      Event(
        id: 1,
        title: "Evento de prueba",
        description: "Descripción del evento de prueba",
        startDate: "2025-09-01T10:00:00Z",
        endDate: "2025-09-01T12:00:00Z",
        imageUrl: "https://picsum.photos/500",
        category: EventCategory(id: 1, name: "Categoría Fake"),
        location: Location(name: "Lugar Fake", lat: 40.0, lng: -3.0),
      ),
    ];
  }

  @override
  Future<List<EventCategory>> getCategories() async {
    return [];
  }

  @override
  Future<Event?> getEventById(int id) async {
    return null;
  }

  @override
  Future<List<Event>> getEvents({int page = 1}) async {
    return [
      Event(
        id: 1,
        title: "Evento de prueba",
        description: "Descripción del evento fake",
        startDate: "2025-09-01T10:00:00Z",
        endDate: "2025-09-01T12:00:00Z",
        imageUrl: "https://picsum.photos/500",
        category: EventCategory(id: 1, name: "Categoría Fake"),
        location: Location(name: "Lugar Fake", lat: 40.0, lng: -3.0),
      ),
    ];
  }

}


void main() {
  testWidgets('EventListPage shows loading indicator and then events',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider<EventsBloc>(
                create: (_) => EventsBloc(FakeRepo())..add(FetchEvents(1)),
              ),
              BlocProvider<FiltersBloc>(
                create: (_) => FiltersBloc(),
              ),
            ],
            child: const MaterialApp(
              home: EventListPage(),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        await tester.pump(const Duration(seconds: 1));

        expect(find.text("Evento de prueba"), findsOneWidget);
      });
}

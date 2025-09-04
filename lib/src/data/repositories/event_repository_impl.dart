import 'package:city_events_explorer/src/data/models/category_model.dart';
import 'package:city_events_explorer/src/domain/entities/category.dart';
import 'package:city_events_explorer/src/domain/entities/event.dart';
import 'package:city_events_explorer/src/domain/repositories/event_repository.dart';
import 'package:city_events_explorer/src/data/models/event_model.dart';
import 'package:city_events_explorer/src/data/datasources/events_json_manager.dart';

class EventRepositoryImpl implements EventRepository {

  EventRepositoryImpl(this.jsonManager);
  final EventsJsonManager jsonManager;

  @override
  Future<List<Event>> getEvents({int page = 1}) async {
    final rawEvents = await jsonManager.getEvents(page: page);
    final models = rawEvents.map((e) => EventModel.fromJson(e)).toList();

    return models.map((m) => m as Event).toList();
  }

  @override
  Future<Event?> getEventById(int id) async {
    final rawEvent = await jsonManager.getEventById(id);
    if (rawEvent == null) return null;
    final model = EventModel.fromJson(rawEvent);
    return model;
  }

  @override
  Future<List<Event>> getEventsFiltered({
    int? categoryId,
    String? startDate,
    String? endDate,
    String? searchValue,
    required int page
}) async {
    final rawEvents = await jsonManager.getEventsByCategory(
      page: page,
      searchValue: searchValue,
      endDate: endDate,
      startDate: startDate,
      categoryId: categoryId
    );
    final models = rawEvents.map((e) => EventModel.fromJson(e)).toList();
    return models.map((m) => m as Event).toList();
  }

  @override
  Future<List<EventCategory>> getCategories() async {
    final rawCategories = await jsonManager.getCategories();
    return rawCategories.map((c) => EventCategoryModel.fromJson(c)).toList();
  }

}

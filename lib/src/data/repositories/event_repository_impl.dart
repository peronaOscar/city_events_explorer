import 'package:city_events_explorer/src/domain/entities/event.dart';
import 'package:city_events_explorer/src/domain/repositories/event_repository.dart';
import 'package:city_events_explorer/src/data/models/event_model.dart';
import 'package:city_events_explorer/src/data/datasources/events_json_manager.dart';

class EventRepositoryImpl implements EventRepository {
  final EventsJsonManager jsonManager;

  EventRepositoryImpl(this.jsonManager);

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
    return model; // EventModel extiende de Event
  }

  @override
  Future<List<Event>> getEventsByCategory(int categoryId) async {
    final rawEvents = await jsonManager.getEventsByCategory(categoryId);
    final models = rawEvents.map((e) => EventModel.fromJson(e)).toList();
    return models.map((m) => m as Event).toList();
  }
}

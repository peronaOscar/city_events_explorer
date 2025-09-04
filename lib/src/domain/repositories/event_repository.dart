import 'package:city_events_explorer/src/domain/entities/category.dart';
import 'package:city_events_explorer/src/domain/entities/event.dart';

abstract class EventRepository {
  Future<List<Event>> getEvents({int page = 1});
  Future<Event?> getEventById(int id);
  Future<List<Event>> getEventsByCategory(int categoryId);
  Future<List<EventCategory>> getCategories();
}
import 'package:city_events_explorer/src/data/datasources/database/event.dart' as hive_event;
import 'package:city_events_explorer/src/data/datasources/database/event_category.dart' as hive_event_category;
import 'package:city_events_explorer/src/data/datasources/database/location.dart' as hive_event_location;
import 'package:city_events_explorer/src/domain/entities/category.dart';
import 'package:city_events_explorer/src/domain/entities/event.dart';
import 'package:city_events_explorer/src/domain/entities/location.dart';
import 'package:hive/hive.dart';

class FavoritesDbManager {
  static const String boxName = 'favoritesBox';

  Future<Box<hive_event.Event>> _openBox() async {
    return await Hive.openBox<hive_event.Event>(boxName);
  }

  /// Obtener todos los favoritos
  Future<List<Event>> getFavorites() async {
    final box = await _openBox();
    // Convertimos de HiveEvent a domain Event
    return box.values.map((e) => _toDomainEvent(e)).toList();
  }

  /// Añadir un evento
  Future<void> addFavorite(Event event) async {
    final box = await _openBox();
    // Convertimos a HiveEvent antes de guardar
    await box.put(event.id, _toHiveEvent(event));
  }

  /// Eliminar un evento
  Future<void> removeFavorite(int id) async {
    final box = await _openBox();
    await box.delete(id);
  }

  /// Comprobar si es favorito
  Future<bool> isFavorite(int id) async {
    final box = await _openBox();
    return box.containsKey(id);
  }

  /// Mapper: domain Event -> HiveEvent
  hive_event.Event _toHiveEvent(Event domainEvent) {
    return hive_event.Event(
      id: domainEvent.id!,
      title: domainEvent.title!,
      description: domainEvent.description!,
      category: hive_event_category.EventCategory(
        id: domainEvent.category!.id!,
        name: domainEvent.category!.name!,
      ),
      startDate: domainEvent.startDate!,
      endDate: domainEvent.endDate!,
      imageUrl: domainEvent.imageUrl!,
      location: hive_event_location.Location(
        name: domainEvent.location!.name!,
        lat: domainEvent.location!.lat!,
        lng: domainEvent.location!.lng!,
      ),
    );
  }

  /// Mapper: HiveEvent -> domain Event
  Event _toDomainEvent(hive_event.Event hiveEvent) {
    return Event(
      id: hiveEvent.id,
      title: hiveEvent.title,
      description: hiveEvent.description,
      category: EventCategory(
        id: hiveEvent.category.id,
        name: hiveEvent.category.name,
      ),
      startDate: hiveEvent.startDate,
      endDate: hiveEvent.endDate,
      imageUrl: hiveEvent.imageUrl,
      location: Location(
        name: hiveEvent.location.name,
        lat: hiveEvent.location.lat,
        lng: hiveEvent.location.lng,
      ),
    );
  }
}

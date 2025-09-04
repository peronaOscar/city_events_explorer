import 'package:city_events_explorer/src/domain/entities/event.dart';

abstract class FavoritesEvent {
  const FavoritesEvent();
}

class LoadFavorites extends FavoritesEvent {
  const LoadFavorites();
}

class AddFavorite extends FavoritesEvent {
  const AddFavorite(this.event);
  final Event event;
}

class RemoveFavorite extends FavoritesEvent {
  const RemoveFavorite(this.eventId);
  final int eventId;
}

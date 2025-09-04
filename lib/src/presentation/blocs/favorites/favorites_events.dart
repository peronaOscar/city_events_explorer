import 'package:city_events_explorer/src/domain/entities/event.dart';

abstract class FavoritesEvent {
  const FavoritesEvent();
}

class LoadFavorites extends FavoritesEvent {
  const LoadFavorites();
}

class AddFavorite extends FavoritesEvent {
  final Event event;
  const AddFavorite(this.event);
}

class RemoveFavorite extends FavoritesEvent {
  final int eventId;
  const RemoveFavorite(this.eventId);
}

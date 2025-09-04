import 'package:city_events_explorer/src/domain/entities/event.dart';

abstract class FavoritesState {
  const FavoritesState();
}

class FavoritesInitial extends FavoritesState {
  const FavoritesInitial();
}

class FavoritesLoading extends FavoritesState {
  const FavoritesLoading();
}

class FavoritesLoaded extends FavoritesState{
  final List<Event> favorites;

  const FavoritesLoaded(this.favorites);

  FavoritesLoaded copyWith({List<Event>? favorites}) {
    return FavoritesLoaded(
      favorites ?? this.favorites,
    );
  }
}

class FavoritesError extends FavoritesState {
  final String message;
  const FavoritesError(this.message);
}
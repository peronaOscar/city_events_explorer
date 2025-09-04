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

  const FavoritesLoaded(this.favorites);
  final List<Event> favorites;

  FavoritesLoaded copyWith({List<Event>? favorites}) {
    return FavoritesLoaded(
      favorites ?? this.favorites,
    );
  }
}

class FavoritesError extends FavoritesState {
  const FavoritesError(this.message);
  final String message;
}
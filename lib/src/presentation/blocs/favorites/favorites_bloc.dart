import 'package:city_events_explorer/src/data/datasources/database/favorites_db_manager.dart';
import 'package:city_events_explorer/src/presentation/blocs/favorites/favorites_events.dart';
import 'package:city_events_explorer/src/presentation/blocs/favorites/favorites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesDbManager db;

  FavoritesBloc(this.db) : super(FavoritesInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<AddFavorite>(_onAddFavorite);
    on<RemoveFavorite>(_onRemoveFavorite);
  }

  Future<void> _onLoadFavorites(
      LoadFavorites event,
      Emitter<FavoritesState> emit,
      ) async {
    emit(const FavoritesLoading());
    try {
      final favorites = await db.getFavorites();
      emit(FavoritesLoaded(favorites));
    } catch (e) {
      emit(FavoritesError("Error loading favorites: $e"));
    }
  }

  Future<void> _onAddFavorite(
      AddFavorite event,
      Emitter<FavoritesState> emit,
      ) async {
    try {
      await db.addFavorite(event.event);
      final favorites = await db.getFavorites();
      emit(FavoritesLoaded(favorites));
    } catch (e) {
      emit(FavoritesError("Error adding favorite: $e"));
    }
  }

  Future<void> _onRemoveFavorite(
      RemoveFavorite event,
      Emitter<FavoritesState> emit,
      ) async {
    try {
      await db.removeFavorite(event.eventId);
      final favorites = await db.getFavorites();
      emit(FavoritesLoaded(favorites));
    } catch (e) {
      emit(FavoritesError("Error removing favorite: $e"));
    }
  }
}
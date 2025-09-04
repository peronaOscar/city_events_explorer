import 'package:city_events_explorer/src/data/datasources/database/favorites_db_manager.dart';
import 'package:city_events_explorer/src/domain/entities/category.dart';
import 'package:city_events_explorer/src/domain/entities/event.dart';
import 'package:city_events_explorer/src/domain/entities/location.dart';
import 'package:city_events_explorer/src/presentation/blocs/favorites/favorites_bloc.dart';
import 'package:city_events_explorer/src/presentation/blocs/favorites/favorites_events.dart';
import 'package:city_events_explorer/src/presentation/blocs/favorites/favorites_state.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeFavoritesDbManager extends FavoritesDbManager {
  final List<Event> _storage = [];

  @override
  Future<List<Event>> getFavorites() async => _storage;

  @override
  Future<void> addFavorite(Event event) async {
    _storage.add(event);
  }

  @override
  Future<void> removeFavorite(int id) async {
    _storage.removeWhere((e) => e.id == id);
  }
}


void main() {
  group('FavoritesBloc', () {
    late FavoritesBloc favoritesBloc;
    late Event fakeEvent;

    setUp(() {
      final fakeDb = FakeFavoritesDbManager();
      favoritesBloc = FavoritesBloc(fakeDb);
      fakeEvent = Event(
        id: 1,
        title: "Evento de prueba",
        description: "Descripción fake",
        startDate: "2025-09-01T10:00:00Z",
        endDate: "2025-09-01T12:00:00Z",
        imageUrl: "https://example.com/fake.png",
        category: EventCategory(id: 1, name: "Fake"),
        location: Location(name: "Fake Place", lat: 40, lng: -3),
      );
    });

    tearDown(() {
      favoritesBloc.close();
    });

    test('initial state is FavoritesInitial', () {
      expect(favoritesBloc.state, const FavoritesInitial());
    });

    test('emits [FavoritesLoading, FavoritesLoaded] when event is added', () {

      expectLater(
        favoritesBloc.stream,
        emitsInOrder([
          const FavoritesLoading(),
          const FavoritesLoaded([]),
        ]),
      );

      favoritesBloc.add(AddFavorite(fakeEvent));
    });

    test('removes event from favorites', () {

      favoritesBloc.emit(FavoritesLoaded([fakeEvent]));
      expectLater(
        favoritesBloc.stream,
        emitsInOrder([
          const FavoritesLoading(),
          const FavoritesLoaded([]),
        ]),
      );

      favoritesBloc.add(RemoveFavorite(fakeEvent.id!));
    });
  });
}

import 'package:city_events_explorer/src/domain/entities/event.dart';
import 'package:city_events_explorer/src/presentation/blocs/events/events_events.dart';
import 'package:city_events_explorer/src/presentation/blocs/events/events_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:city_events_explorer/src/domain/repositories/event_repository.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {

  EventsBloc(this.repo) : super(const EventsInitial()) {
    on<FetchEvents>(_onFetched);
    on<EventsFiltered>(_onFiltered);
  }
  final EventRepository repo;
  List<Event> events = [];

  Future<void> _onFetched(
      FetchEvents event,
      Emitter<EventsState> emit,
      ) async {
    try {
      if(event.page == 1){
        events = [];
      }
      emit(EventsLoadingPage(events: events));
      final newEvents = await repo.getEvents(page: event.page);
      events.addAll(newEvents);
      emit(EventsLoaded(events: events, hasMore: newEvents.isNotEmpty));
    } catch (e) {
      emit(const EventsError("No se han podido cargar los eventos"));
    }
  }

  Future<void> _onFiltered(
      EventsFiltered event,
      Emitter<EventsState> emit,
      ) async {

    if(event.page == 1){
      events = [];
      emit(const EventsLoading());
    } else{
      emit(EventsLoadingPage(events: events));
    }
    try {
      final newEvents = await repo.getEventsFiltered(
        page: event.page,
        categoryId: event.categoryId,
        startDate: event.startDate,
        endDate: event.endDate,
        searchValue: event.searchValue
      );
      events.addAll(newEvents);
      emit(EventsLoaded(events: events, hasMore: newEvents.isNotEmpty));
    } catch (e) {
      emit(const EventsError("No se han podido cargar los eventos"));
    }
  }

}

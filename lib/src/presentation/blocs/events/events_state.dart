import 'package:city_events_explorer/src/domain/entities/event.dart';

abstract class EventsState {
  const EventsState();
}

class EventsInitial extends EventsState {
  const EventsInitial();
}

class EventsLoading extends EventsState {
  const EventsLoading();
}

class EventsLoadingPage extends EventsState {

  const EventsLoadingPage({
    required this.events,
    this.hasMore = true
  });
  final List<Event> events;
  final bool hasMore;

  EventsLoadingPage copyWith({
    List<Event>? items,
  }) {
    return EventsLoadingPage(
      events: items ?? events,
    );
  }

}

class EventsLoaded extends EventsState {

  const EventsLoaded({
    required this.events,
    this.hasMore = true
  });
  final List<Event> events;
  final bool hasMore;

  EventsLoaded copyWith({
    List<Event>? items,
  }) {
    return EventsLoaded(
      events: items ?? events,
    );
  }
}

class EventsError extends EventsState {
  const EventsError(this.message);
  final String message;
}

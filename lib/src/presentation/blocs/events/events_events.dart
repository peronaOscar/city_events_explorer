abstract class EventsEvent {}

class FetchEvents extends EventsEvent {
  FetchEvents(this.page);
  final int page;
}

class EventsFiltered extends EventsEvent {
  EventsFiltered(this.categoryId, this.page);
  final int? categoryId; // null = sin filtro
  final int page;
}

abstract class EventsEvent {}

class FetchEvents extends EventsEvent {
  FetchEvents(this.page);
  final int page;
}

class EventsFiltered extends EventsEvent {
  EventsFiltered({
    this.categoryId,
    this.startDate,
    this.endDate,
    this.searchValue,
    required this.page
  });

  final int? categoryId; // null = sin filtro
  final String? startDate;
  final String? endDate;
  final String? searchValue;
  final int page;
}

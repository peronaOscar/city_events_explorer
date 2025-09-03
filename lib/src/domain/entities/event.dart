import 'package:city_events_explorer/src/domain/entities/category.dart';
import 'package:city_events_explorer/src/domain/entities/location.dart';

class Event {
  int? id;
  String? title;
  String? description;
  EventCategory? category;
  String? startDate;
  String? endDate;
  String? imageUrl;
  Location? location;

  Event(
      {this.id,
        this.title,
        this.description,
        this.category,
        this.startDate,
        this.endDate,
        this.imageUrl,
        this.location});
}
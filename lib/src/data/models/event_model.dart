import 'package:city_events_explorer/src/data/models/category_model.dart';
import 'package:city_events_explorer/src/data/models/location_model.dart';
import 'package:city_events_explorer/src/domain/entities/category.dart';
import 'package:city_events_explorer/src/domain/entities/event.dart';
import 'package:city_events_explorer/src/domain/entities/location.dart';

class EventModel extends Event {
  EventModel({
    super.id,
    super.title,
    super.description,
    super.category,
    super.startDate,
    super.endDate,
    super.imageUrl,
    super.location,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'] != null
        ? EventCategoryModel.fromJson(json['category']) as EventCategory
        : null;
    startDate = json['startDate'];
    endDate = json['endDate'];
    imageUrl = json['imageUrl'];
    location = json['location'] != null
        ? LocationModel.fromJson(json['location']) as Location
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    if (category != null) {
      data['category'] = (category as EventCategoryModel).toJson();
    }
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['imageUrl'] = imageUrl;
    if (location != null) {
      data['location'] = (location as LocationModel).toJson();
    }
    return data;
  }
}

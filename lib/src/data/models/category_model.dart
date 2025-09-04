import 'package:city_events_explorer/src/domain/entities/category.dart';

class EventCategoryModel extends EventCategory {
  EventCategoryModel({super.id, super.name});

  EventCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

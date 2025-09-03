import 'package:city_events_explorer/src/domain/entities/location.dart';

class LocationModel extends Location{
  LocationModel({super.name, super.lat, super.lng});

  LocationModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
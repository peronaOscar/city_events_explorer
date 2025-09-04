import 'package:hive/hive.dart';

part 'location.g.dart';

@HiveType(typeId: 2)
class Location {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final double lat;

  @HiveField(2)
  final double lng;

  Location({
    required this.name,
    required this.lat,
    required this.lng,
  });
}

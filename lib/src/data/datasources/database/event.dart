import 'package:hive/hive.dart';
import 'event_category.dart';
import 'location.dart';

part 'event.g.dart';

@HiveType(typeId: 3)
class Event {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final EventCategory category;

  @HiveField(4)
  final String startDate;

  @HiveField(5)
  final String endDate;

  @HiveField(6)
  final String imageUrl;

  @HiveField(7)
  final Location location;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
    required this.location,
  });
}

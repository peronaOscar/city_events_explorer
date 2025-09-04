import 'package:hive/hive.dart';

part 'event_category.g.dart';

@HiveType(typeId: 1)
class EventCategory {

  EventCategory({
    required this.id,
    required this.name,
  });
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;
}

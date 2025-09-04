import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class EventsJsonManager {
  final String path;
  final int pageSize;

  EventsJsonManager({
    this.path = 'assets/data/events.json',
    this.pageSize = 10,
  });

  /// Cargar el JSON de eventos desde assets
  Future<List<Map<String, dynamic>>> _loadEvents() async {
    final jsonString = await rootBundle.loadString(path);
    final List<dynamic> decoded = json.decode(jsonString);
    return decoded.cast<Map<String, dynamic>>();
  }

  /// Obtener eventos por página (10 eventos por página)
  Future<List<Map<String, dynamic>>> getEvents({int page = 1}) async {
    await Future.delayed(
      const Duration(seconds: 1),
    ); //Simula tiempo de espera de la petición
    final events = await _loadEvents();
    final startIndex = (page - 1) * pageSize;
    final endIndex = startIndex + pageSize;

    if (startIndex >= events.length) return [];

    return events.sublist(
      startIndex,
      endIndex > events.length ? events.length : endIndex,
    );
  }

  /// Obtener un evento por ID
  Future<Map<String, dynamic>?> getEventById(int id) async {
    final events = await _loadEvents();
    try {
      return events.firstWhere((e) => e['id'] == id);
    } catch (_) {
      return null;
    }
  }

  /// Obtener eventos segun los filtros
  Future<List<Map<String, dynamic>>> getEventsByCategory({
    int? categoryId,
    String? startDate,
    String? endDate,
    String? searchValue,
    required int page
}) async {

    await Future.delayed(const Duration(seconds: 1),); //Simula tiempo de espera de la petición
    var events = await _loadEvents();

    if(categoryId != null){
      events = events.where((e) => e['category']['id'] == categoryId).toList();
    }

    if (startDate != null || endDate != null) {
      final start = startDate != null ? DateTime.parse(startDate) : null;
      final end = endDate != null ? DateTime.parse(endDate) : null;

      events = events.where((e) {
        final eventStart = DateTime.parse(e['startDate']);
        final eventEnd = DateTime.parse(e['endDate']);

        final afterStart = start == null || eventStart.isAfter(start) || eventStart.isAtSameMomentAs(start);
        final beforeEnd = end == null || eventEnd.isBefore(end) || eventEnd.isAtSameMomentAs(end);

        return afterStart && beforeEnd;
      }).toList();
    }

    return events;
  }

  /// Obtener todas las categorías
  Future<List<Map<String, dynamic>>> getCategories() async {
    final events = await _loadEvents();

    final seenIds = <int>{};
    final categories = <Map<String, dynamic>>[];

    for (final e in events) {
      final category = e['category'] as Map<String, dynamic>;
      final id = category['id'] as int;

      if (seenIds.add(id)) {
        categories.add(category);
      }
    }

    return categories;
  }
}

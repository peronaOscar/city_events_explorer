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

  /// Obtener todos los eventos de una categoría
  Future<List<Map<String, dynamic>>> getEventsByCategory(int categoryId) async {
  final events = await _loadEvents();
    return events
        .where((e) => e['category']['id'] == categoryId)
        .toList();
  }
}

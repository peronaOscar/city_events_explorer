import 'package:city_events_explorer/src/app.dart';
import 'package:city_events_explorer/src/data/datasources/database/event.dart';
import 'package:city_events_explorer/src/data/datasources/database/event_category.dart';
import 'package:city_events_explorer/src/data/datasources/database/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar Hive
  Hive.initFlutter();

  Hive.registerAdapter(EventAdapter());
  Hive.registerAdapter(EventCategoryAdapter());
  Hive.registerAdapter(LocationAdapter());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const EventExplorerApp());
  });
}

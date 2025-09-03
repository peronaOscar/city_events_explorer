import 'package:city_events_explorer/src/config/routes/navigator_router.dart';
import 'package:city_events_explorer/src/config/routes/navigator_routes.dart';
import 'package:city_events_explorer/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class EventExplorerApp extends StatelessWidget {
  const EventExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'City Events Explorer',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        initialRoute: NavigatorRoutes.home,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
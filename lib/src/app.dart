import 'package:city_events_explorer/src/config/routes/navigator_router.dart';
import 'package:city_events_explorer/src/config/routes/navigator_routes.dart';
import 'package:city_events_explorer/src/config/theme/app_theme.dart';
import 'package:city_events_explorer/src/data/datasources/database/favorites_db_manager.dart';
import 'package:city_events_explorer/src/data/datasources/events_json_manager.dart';
import 'package:city_events_explorer/src/data/repositories/event_repository_impl.dart';
import 'package:city_events_explorer/src/presentation/blocs/categories/categories_bloc.dart';
import 'package:city_events_explorer/src/presentation/blocs/categories/categories_events.dart';
import 'package:city_events_explorer/src/presentation/blocs/events/events_bloc.dart';
import 'package:city_events_explorer/src/presentation/blocs/events/events_events.dart';
import 'package:city_events_explorer/src/presentation/blocs/favorites/favorites_bloc.dart';
import 'package:city_events_explorer/src/presentation/blocs/favorites/favorites_events.dart';
import 'package:city_events_explorer/src/presentation/blocs/filters/filters_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventExplorerApp extends StatelessWidget {
  const EventExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                CategoriesBloc(EventRepositoryImpl(EventsJsonManager()))
                  ..add(FetchCategories()),
          ),
          BlocProvider(
            create: (_) =>
                EventsBloc(EventRepositoryImpl(EventsJsonManager()))
                  ..add(FetchEvents(1)),
          ),
          BlocProvider(create: (_) => FiltersBloc()),
          BlocProvider(
            create: (_) => FavoritesBloc(FavoritesDbManager())..add(const LoadFavorites()),
          ),
        ],
        child: MaterialApp(
          title: 'City Events Explorer',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          initialRoute: NavigatorRoutes.home,
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}

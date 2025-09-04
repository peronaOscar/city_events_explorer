import 'package:city_events_explorer/src/config/theme/colors.dart';
import 'package:city_events_explorer/src/presentation/blocs/favorites/favorites_bloc.dart';
import 'package:city_events_explorer/src/presentation/blocs/favorites/favorites_state.dart';
import 'package:city_events_explorer/src/presentation/widgets/card/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: AppColors.surface),
        ),
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoritesError) {
            return Center(child: Text(state.message));
          } else if (state is FavoritesLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  final event = state.favorites[index];
                  return EventCard(event: event);
                },
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

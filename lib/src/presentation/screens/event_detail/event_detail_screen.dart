import 'package:city_events_explorer/src/config/theme/app_theme.dart';
import 'package:city_events_explorer/src/config/theme/colors.dart';
import 'package:city_events_explorer/src/data/models/event_model.dart';
import 'package:city_events_explorer/src/domain/entities/event.dart';
import 'package:city_events_explorer/src/presentation/blocs/favorites/favorites_bloc.dart';
import 'package:city_events_explorer/src/presentation/blocs/favorites/favorites_events.dart';
import 'package:city_events_explorer/src/presentation/blocs/favorites/favorites_state.dart';
import 'package:city_events_explorer/src/presentation/screens/event_detail/widgets/detail_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({super.key, required this.event});

  final Event event;

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {

  late DateTime startDate;
  late String formattedDate;

  @override
  void initState() {

    startDate = DateTime.parse(widget.event.startDate!);
    formattedDate = DateFormat.yMMMMd().add_jm().format(startDate);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          BlocBuilder<FavoritesBloc, FavoritesState>(
              builder: (context, state) {
                bool isFavorite = false;

                if (state is FavoritesLoaded) {
                  isFavorite = state.favorites.any((e) => e.id == widget.event.id);
                }

                return IconButton(
                  onPressed: (){
                    _manageFavorite(widget.event, isFavorite);
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 24,
                    color: AppColors.black,
                  ),
                );
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.event.title!,
                style: AppTheme.textTheme.headlineMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  child: Image.network(
                    widget.event.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                widget.event.description!,
                style: AppTheme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 24, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                        widget.event.location!.name!,
                        style: AppTheme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary)
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.event, size: 24, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(
                      formattedDate,
                      style: AppTheme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary)
          
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              DetailMap(location: widget.event.location!),
              const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }

  void _manageFavorite(Event event, bool isFavorite){
    if(isFavorite){
      context.read<FavoritesBloc>().add(RemoveFavorite(event.id!));
    } else{
      context.read<FavoritesBloc>().add(AddFavorite(event));
    }
  }
}

import 'package:city_events_explorer/src/config/theme/colors.dart';
import 'package:city_events_explorer/src/domain/entities/event.dart';
import 'package:city_events_explorer/src/presentation/blocs/events/events_bloc.dart';
import 'package:city_events_explorer/src/presentation/blocs/events/events_events.dart';
import 'package:city_events_explorer/src/presentation/blocs/events/events_state.dart';
import 'package:city_events_explorer/src/presentation/blocs/filters/filters_bloc.dart';
import 'package:city_events_explorer/src/presentation/blocs/filters/filters_state.dart';
import 'package:city_events_explorer/src/presentation/widgets/card/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventListPage extends StatefulWidget {
  const EventListPage({super.key});

  @override
  State<EventListPage> createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  final ScrollController _scrollController = ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
        if (context.read<EventsBloc>().state is EventsLoadingPage == false) {
          page++;
          if (context.read<FiltersBloc>().state is NoFiltered) {
            context.read<EventsBloc>().add(FetchEvents(page));
          } else {
            final Filtered filterStatus = (context.read<FiltersBloc>().state as Filtered);
            context.read<EventsBloc>().add(
              EventsFiltered(
                page: page,
                categoryId: filterStatus.selectedCategoryId,
                startDate: filterStatus.startDate,
                endDate: filterStatus.endDate,
                searchValue: filterStatus.startDate,
              ),
            );

          }
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          List<Event> events = [];
          bool hasMore = false;

          if (state is EventsInitial) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryDark),
            );
          } else if (state is EventsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryDark),
            );
          } else if (state is EventsError) {
            return Center(child: Text(state.message));
          } else if (state is EventsLoaded) {
            events = state.events;
            hasMore = state.hasMore;
          } else if (state is EventsLoadingPage) {
            events = (state).events;
            hasMore = state.hasMore;
          }

          return ListView.builder(
            shrinkWrap: true,
            controller: _scrollController,
            itemCount: events.length + ((hasMore) ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < events.length) {
                return EventCard(event: events[index]);
              } else {
                if (state is EventsLoadingPage) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryDark,
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              }
            },
          );
        },
      ),
    );
  }
}

import 'package:city_events_explorer/src/config/routes/navigator_routes.dart';
import 'package:city_events_explorer/src/config/theme/app_theme.dart';
import 'package:city_events_explorer/src/config/theme/colors.dart';
import 'package:city_events_explorer/src/data/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    final DateTime startDate = DateTime.parse(event.startDate!);
    final formattedDate = DateFormat.yMMMMd().add_jm().format(startDate);

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, NavigatorRoutes.detail, arguments: event);
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                event.imageUrl!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title!,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          event.location!.name!,
                          style: AppTheme.textTheme.labelLarge?.copyWith(color: AppColors.textSecondary)
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.event, size: 16, color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Text(
                        formattedDate,
                          style: AppTheme.textTheme.labelLarge?.copyWith(color: AppColors.textSecondary)

                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

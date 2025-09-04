import 'package:city_events_explorer/src/config/theme/app_theme.dart';
import 'package:city_events_explorer/src/config/theme/colors.dart';
import 'package:city_events_explorer/src/domain/entities/category.dart';
import 'package:flutter/material.dart';

class SelectedCategoryCard extends StatelessWidget {
  const SelectedCategoryCard({super.key, required this.category, required this.onTap});

  final EventCategory category;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: AppColors.onSurface,
            border: Border.all(color: AppColors.black, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              category.name!,
              textAlign: TextAlign.center,
              style: AppTheme.textTheme.labelLarge
            ),
          ),
        ),
      ),
    );
  }
}

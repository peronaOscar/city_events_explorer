import 'package:city_events_explorer/src/config/theme/colors.dart';
import 'package:city_events_explorer/src/domain/entities/category.dart';
import 'package:city_events_explorer/src/presentation/blocs/categories/categories_bloc.dart';
import 'package:city_events_explorer/src/presentation/blocs/categories/categories_events.dart';
import 'package:city_events_explorer/src/presentation/blocs/categories/categories_state.dart';
import 'package:city_events_explorer/src/presentation/blocs/events/events_bloc.dart';
import 'package:city_events_explorer/src/presentation/blocs/events/events_events.dart';
import 'package:city_events_explorer/src/presentation/blocs/filters/filters_bloc.dart';
import 'package:city_events_explorer/src/presentation/blocs/filters/filters_events.dart';
import 'package:city_events_explorer/src/presentation/screens/home/widgets/selected_category_card.dart';
import 'package:city_events_explorer/src/presentation/screens/home/widgets/unselected_category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 85,
            child: Container(
              color: AppColors.primary,
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            child: _searchBar()
          ),
          Positioned(
              left: 16,
              right: 16,
              bottom: 0,
              height: 52,
              child: _categoryList()
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search...",
              filled: true,
              fillColor: AppColors.surface,
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: (){
            showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 90)));
          },
          child: const Icon(
            Icons.calendar_today,
            size: 24,
            color: AppColors.surface,
          ),
        ),
      ],
    );
  }

  Widget _categoryList() {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoaded) {
          final categories = state.items;
          final selectedId = state.selectedCategoryId;

          return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final category = categories[index];
                final isSelected = selectedId == category.id;

                if (isSelected) {
                  return SelectedCategoryCard(
                    category: category,
                    onTap: () {
                      _filterList(category);
                    },
                  );
                } else {
                  return UnselectedCategoryCard(
                    category: category,
                    onTap: () {
                      _filterList(category);
                    },
                  );
                }
              },
            ),
          );
        }else{
          return Container();
        }

      },
    );
  }

  void _filterList(EventCategory category){
    context.read<CategoriesBloc>().add(CategorySelected(category.id));
    context.read<EventsBloc>().add(EventsFiltered(category.id, 1));
    context.read<FiltersBloc>().add(CreateFilters(selectedCategoryId: category.id));
  }

}
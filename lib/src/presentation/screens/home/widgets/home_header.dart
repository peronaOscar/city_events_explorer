import 'package:city_events_explorer/src/config/theme/app_theme.dart';
import 'package:city_events_explorer/src/config/theme/colors.dart';
import 'package:flutter/material.dart';

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
              height: 50,
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

  Widget _categoryList(){

    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: AppColors.onSurface
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Lorem ipsum",
                textAlign: TextAlign.center,
                style: AppTheme.textTheme.labelLarge?.copyWith(color: AppColors.surface),
              ),
            ),
          ),
        );
      }
    );
  }
}

import 'package:city_events_explorer/src/domain/entities/category.dart';

abstract class CategoriesState {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {
  const CategoriesInitial();
}

class CategoriesLoading extends CategoriesState {
  const CategoriesLoading();
}

class CategoriesLoaded extends CategoriesState {

  const CategoriesLoaded({
    required this.items,
    this.selectedCategoryId,
  });
  final List<EventCategory> items;
  final int? selectedCategoryId;

  CategoriesLoaded copyWith({
    List<EventCategory>? items,
    int? selectedCategoryId,
  }) {
    return CategoriesLoaded(
      items: items ?? this.items,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
    );
  }
}

class CategoriesError extends CategoriesState {
  const CategoriesError(this.message);
  final String message;
}

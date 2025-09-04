abstract class CategoriesEvent {}

class FetchCategories extends CategoriesEvent {}

class CategorySelected extends CategoriesEvent {
  CategorySelected(this.categoryId);
  final int? categoryId; // null = sin filtro
}

import 'package:city_events_explorer/src/presentation/blocs/categories/categories_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:city_events_explorer/src/domain/repositories/event_repository.dart';
import 'package:city_events_explorer/src/presentation/blocs/categories/categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final EventRepository repo;

  CategoriesBloc(this.repo) : super(const CategoriesInitial()) {
    on<FetchCategories>(_onFetched);
    on<CategorySelected>(_onSelected);
  }

  Future<void> _onFetched(
    FetchCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(const CategoriesLoading());
    try {
      final categories = await repo.getCategories();
      emit(CategoriesLoaded(items: categories));
    } catch (e) {
      emit(CategoriesError("Error al cargar categorías: $e"));
    }
  }

  void _onSelected(CategorySelected event, Emitter<CategoriesState> emit) {
    final currentState = state;
    if (currentState is CategoriesLoaded) {
      int? id  = event.categoryId;

      if (currentState.selectedCategoryId == id) {
        id = null;
      }
      emit(CategoriesLoaded(items: currentState.items, selectedCategoryId: id));
    }
  }
}

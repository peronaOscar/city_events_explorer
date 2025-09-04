import 'package:city_events_explorer/src/presentation/blocs/filters/filters_events.dart';
import 'package:city_events_explorer/src/presentation/blocs/filters/filters_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {

  FiltersBloc() : super(const NoFiltered()) {
    on<DeleteFilters>(_deleteFilters);
    on<CreateFilters>(_createFilters);
  }

  void _deleteFilters(DeleteFilters event, Emitter<FiltersState> emit){
    emit(const NoFiltered());
  }

  void _createFilters(CreateFilters event, Emitter<FiltersState> emit){

    if(state is NoFiltered){
      emit(Filtered(
          startDate: event.startDate,
          endDate: event.endDate,
          selectedCategoryId: event.selectedCategoryId,
          searchValue: event.searchValue,
          filtered: true
      ));
    } else{
      emit(Filtered(
          startDate: event.startDate ?? (state as Filtered).startDate,
          endDate: event.endDate ?? (state as Filtered).endDate,
          selectedCategoryId: event.selectedCategoryId ?? (state as Filtered).selectedCategoryId,
          searchValue: event.searchValue ?? (state as Filtered).searchValue,
          filtered: true
      ));
    }
  }
}
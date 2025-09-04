abstract class FiltersEvent {}

class DeleteFilters extends FiltersEvent {}

class CreateFilters extends FiltersEvent {
  CreateFilters({
    this.selectedCategoryId,
    this.startDate,
    this.endDate,
    this.searchValue,
    this.filtered = false,
  });

  final int? selectedCategoryId;
  final String? startDate;
  final String? endDate;
  final String? searchValue;
  final bool filtered;
}

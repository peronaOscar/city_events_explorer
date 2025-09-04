
abstract class FiltersState {
  const FiltersState();
}

class NoFiltered extends FiltersState {
  const NoFiltered();
}

class Filtered extends FiltersState {

  const Filtered({
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



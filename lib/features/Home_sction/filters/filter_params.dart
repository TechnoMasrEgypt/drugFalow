// ─────────────────────────────────────────────
// lib/features/Home_sction/products/data/models/filter_params.dart
// ─────────────────────────────────────────────

/// Immutable DTO that travels from FilterCubit → Cubit → Repo → ApiService.
/// Using a single object keeps every method signature clean.
class FilterParams {
  final List<int> medicineIds;
  final List<int> ingredientIds;
  final String? sort; // e.g. "price_asc"

  const FilterParams({
    this.medicineIds = const [],
    this.ingredientIds = const [],
    this.sort,
  });

  const FilterParams.empty()
      : medicineIds = const [],
        ingredientIds = const [],
        sort = null;

  /// Converts to Dio-compatible query parameters.
  /// Adjust key names to match your backend.
  Map<String, dynamic> toQueryParams() {
    return {
      if (medicineIds.isNotEmpty) 'medicine_ids[]': medicineIds,
      if (ingredientIds.isNotEmpty) 'ingredient_ids[]': ingredientIds,
      if (sort != null && sort!.isNotEmpty) 'sort': sort,
    };
  }
}
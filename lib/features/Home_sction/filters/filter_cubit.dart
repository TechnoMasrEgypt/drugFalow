// ─────────────────────────────────────────────
// lib/features/Home_sction/products/presentation/cubit/filter/filter_cubit.dart
// ─────────────────────────────────────────────

import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/features/Home_sction/filters/data.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_params.dart';
import 'package:drug_flow/features/Home_sction/home/data/repos/warehouse_repos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  final WarehouseRepository _repo;
 
  FilterCubit(this._repo) : super(const FilterState.initial());
 
  // ── In-memory list state (survives sheet close/reopen) ──
  final List<FilterItemModel> _medicines = [];
  final List<FilterItemModel> _ingredients = [];
  SortOption _sort = SortOption.priceDesc;
 
  // ── Public getters ──
  SortOption get currentSort => _sort;
  List<FilterItemModel> get medicines => List.unmodifiable(_medicines);
  List<FilterItemModel> get ingredients => List.unmodifiable(_ingredients);
 
  int get activeFilterCount =>
      _medicines.where((m) => m.isSelected).length +
      _ingredients.where((i) => i.isSelected).length;
 
  // ─────────────────────────────────────────────
  // Fetch from API
  // ─────────────────────────────────────────────
 
  Future<void> loadMedicines() async {
    // Don't re-fetch if already loaded
    if (_medicines.isNotEmpty) {
      emit(FilterState.medicinesLoaded(medicines: List.from(_medicines)));
      return;
    }
    emit(const FilterState.loading());
    final result = await _repo.getMedicines();
    result.when(
      success: (response) {
        _medicines
          ..clear()
          ..addAll(response.data);
        emit(FilterState.medicinesLoaded(medicines: List.from(_medicines)));
      },
      failure: (e) => emit(FilterState.error(e.apiErrorModel.message ?? '')),
    );
  }
 
  Future<void> loadIngredients() async {
    if (_ingredients.isNotEmpty) {
      emit(FilterState.ingredientsLoaded(ingredients: List.from(_ingredients)));
      return;
    }
    emit(const FilterState.loading());
    final result = await _repo.getActiveIngredients();
    result.when(
      success: (response) {
        _ingredients
          ..clear()
          ..addAll(response.data);
        emit(FilterState.ingredientsLoaded(
            ingredients: List.from(_ingredients)));
      },
      failure: (e) => emit(FilterState.error(e.apiErrorModel.message ?? '')),
    );
  }
 
  // ─────────────────────────────────────────────
  // Toggle selection
  // ─────────────────────────────────────────────
 
  void toggleMedicine(int id) {
    final idx = _medicines.indexWhere((m) => m.id == id);
    if (idx == -1) return;
    _medicines[idx] =
        _medicines[idx].copyWith(isSelected: !_medicines[idx].isSelected);
    emit(FilterState.medicinesLoaded(medicines: List.from(_medicines)));
  }
 
  void toggleIngredient(int id) {
    final idx = _ingredients.indexWhere((i) => i.id == id);
    if (idx == -1) return;
    _ingredients[idx] =
        _ingredients[idx].copyWith(isSelected: !_ingredients[idx].isSelected);
    emit(FilterState.ingredientsLoaded(ingredients: List.from(_ingredients)));
  }
 
  void setSort(SortOption option) => _sort = option;
 
  // ─────────────────────────────────────────────
  // Build FilterParams — passed directly to ProductsCubit / WarehouseCubit
  // ─────────────────────────────────────────────
 
  FilterParams buildParams() => FilterParams(
        medicineIds:
            _medicines.where((m) => m.isSelected).map((m) => m.id).toList(),
        ingredientIds:
            _ingredients.where((i) => i.isSelected).map((i) => i.id).toList(),
        sort: _sort.queryValue,
      );
 
  /// Emits [FilterState.filtersApplied] — screens listen to this
  /// and call their own cubits with [params].
  void applyFilters() {
    emit(FilterState.filtersApplied(params: buildParams()));
  }
 
  void resetFilters() {
    for (var i = 0; i < _medicines.length; i++) {
      _medicines[i] = _medicines[i].copyWith(isSelected: false);
    }
    for (var i = 0; i < _ingredients.length; i++) {
      _ingredients[i] = _ingredients[i].copyWith(isSelected: false);
    }
    _sort = SortOption.priceDesc;
    applyFilters();
  }
}
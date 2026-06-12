// ─────────────────────────────────────────────
// lib/features/Home_sction/products/presentation/cubit/filter/filter_state.dart
// ─────────────────────────────────────────────

import 'package:drug_flow/features/Home_sction/filters/data.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_state.freezed.dart';

@freezed
class FilterState with _$FilterState {
  const factory FilterState.initial() = _Initial;

  const factory FilterState.loading() = Loading;

  const factory FilterState.medicinesLoaded({
    required List<FilterItemModel> medicines,
  }) = _MedicinesLoaded;

  const factory FilterState.ingredientsLoaded({
    required List<FilterItemModel> ingredients,
  }) = _IngredientsLoaded;

  /// Emitted when user taps "تطبيق".
  /// [params] is ready-to-use — pass it straight to
  /// ProductsCubit.getProducts(params: params)
  /// or WarehouseCubit.getWarehouseDetails(id: id, params: params).
  const factory FilterState.filtersApplied({
    required FilterParams params,
  }) = FiltersApplied;

  const factory FilterState.error(String message) = _Error;
}
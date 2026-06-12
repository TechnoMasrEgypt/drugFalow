// ─────────────────────────────────────────────
// lib/features/Home_sction/products/presentation/cubit/search/medicine_search_state.dart
// ─────────────────────────────────────────────

import 'package:drug_flow/features/Home_sction/filters/data.dart';
import 'package:drug_flow/features/Home_sction/home/data/search_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicine_search_state.freezed.dart';

@freezed
class MedicineSearchState with _$MedicineSearchState {
  const factory MedicineSearchState.idle() = Idle;
  const factory MedicineSearchState.loading() = Loading;
  const factory MedicineSearchState.success({
    required List<SearchProductModel> results,
  }) = Success;
  const factory MedicineSearchState.empty() = _Empty;
  const factory MedicineSearchState.error(String message) = _Error;
}
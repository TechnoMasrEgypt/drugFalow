// ─────────────────────────────────────────────
// lib/features/Home_sction/products/data/repos/filter_repository.dart
// ─────────────────────────────────────────────

import 'package:dio/dio.dart';
import 'package:drug_flow/core/networking/api_services.dart';
import 'package:drug_flow/features/Home_sction/filters/data.dart';

class FilterRepository {
  final ApiService _apiService; // your existing Dio wrapper

  FilterRepository(this._apiService);

  Future<List<FilterItemModel>> getMedicines() async {
    final response = await _apiService.medicine();
    final parsed = FilterListResponse.fromJson(response.data as Map<String, dynamic>);
    return parsed.data;
  }

  Future<List<FilterItemModel>> getActiveIngredients() async {
    final response = await _apiService.ingrdiante();
    final parsed = FilterListResponse.fromJson(response.data as Map<String, dynamic>);
    return parsed.data;
  }
}
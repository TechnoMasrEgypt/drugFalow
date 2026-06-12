// lib/features/Home_sction/home/data/repos/warehouse_repos.dart

import 'package:dio/dio.dart';
import 'package:drug_flow/core/networking/api_error_handler.dart';
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/core/networking/api_services.dart';
import 'package:drug_flow/core/networking/endPoints.dart';
import 'package:drug_flow/features/Home_sction/filters/data.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_params.dart';
import 'package:drug_flow/features/Home_sction/home/data/search_response.dart';
import 'package:drug_flow/features/Home_sction/home/data/slider_response.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_response.dart';
import 'package:drug_flow/features/Home_sction/products/data/products_response.dart';

class WarehouseRepository {
  final ApiService _apiService;

  // Reuse the exact same Dio that Retrofit already configured
  // (base URL + auth headers + interceptors) — no separate Dio needed.
  Dio get _dio => (_apiService as dynamic).dio as Dio;

  // ── Constructor: one arg only now ────────────────────────
  WarehouseRepository(this._apiService);

  // ── Unchanged ────────────────────────────────────────────

  Future<ApiResult<WarehouseResponse>> warehouses() async {
    try {
      return ApiResult.success(await _apiService.warehouses());
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<SliderResponse>> slides() async {
    try {
      return ApiResult.success(await _apiService.slides());
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<FilterListResponse>> getMedicines() async {
    try {
      return ApiResult.success(await _apiService.medicine());
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
Future<ApiResult<SearchData>> searchMedicines(String query) async {
  try {
    final response = await _apiService.searchMedicines(query);
    return ApiResult.success(response.data);
  } catch (e) {
    return ApiResult.failure(ErrorHandler.handle(e));
  }
}

  Future<ApiResult<FilterListResponse>> getActiveIngredients() async {
    try {
      return ApiResult.success(await _apiService.ingrdiante());
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  // ── Products ──────────────────────────────────────────────

   Future<ApiResult<WarehouseDetailsResponse>> warehouseDetails(
    int id, {
    FilterParams params = const FilterParams.empty(),
  }) async {
    try {
      final response = await _apiService.warehouseDetails(
        id,
        sort: params.sort,
        filters: params.toQueryParams()
          ..remove('sort'), // sort already sent separately
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
 
  Future<ApiResult<List<ProductModel>>> products({
    FilterParams params = const FilterParams.empty(),
  }) async {
    try {
      final response = await _apiService.products(
        sort: params.sort,
        filters: params.toQueryParams()..remove('sort'),
      );
      return ApiResult.success(response.data?.items ?? []);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  // ── Query builder ─────────────────────────────────────────

  Map<String, dynamic> _buildQuery(FilterParams params) {
    final Map<String, dynamic> q = {};
    if (params.sort != null && params.sort!.isNotEmpty) {
      q['sort'] = params.sort;
    }
    if (params.medicineIds.isNotEmpty) {
      q['medicine_ids[]'] = params.medicineIds;
    }
    if (params.ingredientIds.isNotEmpty) {
      q['ingredient_ids[]'] = params.ingredientIds;
    }
    return q;
  }
}

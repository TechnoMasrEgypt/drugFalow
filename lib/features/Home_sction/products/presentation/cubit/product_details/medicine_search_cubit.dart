// lib/features/Home_sction/products/presentation/cubit/search/medicine_search_cubit.dart

import 'dart:async';
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/features/Home_sction/home/data/search_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drug_flow/features/Home_sction/home/data/repos/warehouse_repos.dart';
import 'medicine_search_state.dart';

class MedicineSearchCubit extends Cubit<MedicineSearchState> {
  final WarehouseRepository _repo;

  MedicineSearchCubit(this._repo) : super(const MedicineSearchState.idle());

  Timer? _debounce;

  List<SearchProductModel> lastResults = [];
  List<SearchWarehouse> lastWarehouses = []; // ← declared

  void onQueryChanged(String query) {
    _debounce?.cancel();
    final trimmed = query.trim();

    if (trimmed.isEmpty) {
      emit(const MedicineSearchState.empty());
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 400), () {
      emit(const MedicineSearchState.loading());
      _search(trimmed);
    });
  }

  Future<void> _search(String query) async {
    final result = await _repo.searchMedicines(query);
    result.when(
      success: (data) {
        lastResults = data.products;
        lastWarehouses = data.warehouses;
        emit(MedicineSearchState.success(results: data.products));
      },
      failure: (e) =>
          emit(MedicineSearchState.error(e.apiErrorModel.message ?? '')),
    );
  }

  void clear() {
    _debounce?.cancel();
    lastResults = [];
    lastWarehouses = [];
    emit(const MedicineSearchState.idle());
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
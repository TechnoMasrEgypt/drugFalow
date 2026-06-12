// ─────────────────────────────────────────────
// lib/features/Home_sction/products/presentation/cubit/products/products_cubit.dart
// (UPDATED)
// ─────────────────────────────────────────────

import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_params.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:drug_flow/features/Home_sction/home/data/repos/warehouse_repos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final WarehouseRepository _repo;

  ProductsCubit(this._repo) : super(const ProductsState.initial());

  List<ProductModel> products = [];

  /// Call with no arguments for the initial load.
  /// Call with [params] after the user applies filters.
  Future<void> getProducts({
    FilterParams params = const FilterParams.empty(),
  }) async {
    emit(const ProductsState.loading());

    final result = await _repo.products(params: params);

    result.when(
      success: (data) {
        products = data;
        emit(ProductsState.success(products));
      },
      failure: (error) {
        emit(ProductsState.error(error.apiErrorModel.message ?? 'Error'));
      },
    );
  }
}
// ─────────────────────────────────────────────
// lib/features/Home_sction/home/logic/home_cubit.dart  (UPDATED)
// ─────────────────────────────────────────────

import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_params.dart';
import 'package:drug_flow/features/Home_sction/home/data/repos/warehouse_repos.dart';
import 'package:drug_flow/features/Home_sction/home/data/slider_response.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_response.dart';
import 'package:drug_flow/features/Home_sction/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WarehouseCubit extends Cubit<WarehouseState> {
  final WarehouseRepository _warehouseRepository;

  WarehouseCubit(this._warehouseRepository)
    : super(const WarehouseState.initial());
  int currentindex = 0;

  List<WarehouseItem>? warehouses = [];

  Future<void> getWarehouses() async {
    emit(const WarehouseState.loading());
    final response = await _warehouseRepository.warehouses();
    response.when(
      success: (warehousesResponse) {
        warehouses = warehousesResponse.data?.items ?? [];
        emit(WarehouseState.success(warehouses));
      },
      failure: (errorHandler) {
        emit(WarehouseState.error(error: errorHandler));
      },
    );
  }

WarehouseDetailsResponse? warehouseDetails; // ← change type

  /// [id] is always required.
  /// [params] is optional — omit it for the first load, pass it after filters.
  Future<void> getWarehouseDetails({
    required int id,
    FilterParams params = const FilterParams.empty(),
  }) async {
    emit(const WarehouseState.detailsStateloading());
    final response = await _warehouseRepository.warehouseDetails(
      id,
      params: params,
    );
    response.when(
      success: (warehouseDetailsResponse) {
      warehouseDetails = warehouseDetailsResponse; // ← store full response
        emit(WarehouseState.detailsStatesuccess(warehouseDetails));
        print("dataaaaaaaaaaaaaaaaaa   $warehouseDetails");
      },
      failure: (errorHandler) {
        emit(WarehouseState.detailsStateerror(error: errorHandler));
      },
    );
  }
  SliderResponse? sliderResponse;

Future<void> getSlides() async {
  emit(const WarehouseState.loading());

  final response = await _warehouseRepository.slides();

  response.when(
    success: (data) {
      sliderResponse = data;
      emit(const WarehouseState.initial());
    },
    failure: (error) {
      emit(WarehouseState.error(error: error));
    },
  );
}
}

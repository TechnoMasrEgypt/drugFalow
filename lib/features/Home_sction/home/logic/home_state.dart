import 'package:drug_flow/core/networking/api_error_handler.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'home_state.freezed.dart';

// @freezed
// class HomeState with _$HomeState {
//   const factory HomeState.initial() = _Initial;


// }
 @freezed
class WarehouseState with _$WarehouseState {
  const factory WarehouseState.initial() = _Initial;
  const factory WarehouseState.loading() = _Loading;
  const factory WarehouseState.success(List<WarehouseItem?>? warehouses) = _Success;
  const factory WarehouseState.error({required ErrorHandler error}) = _Error;
  const factory WarehouseState.detailsStateloading() = _DetailsLoading;
  const factory WarehouseState.detailsStatesuccess(WarehouseDetailsResponse? warehouses) = _DetailsSuccess;
  const factory WarehouseState.detailsStateerror({required ErrorHandler error}) = _DetailsError;
}


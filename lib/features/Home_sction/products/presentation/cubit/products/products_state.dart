import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';

part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.loading() = _Loading;
  const factory ProductsState.success(List<ProductModel> products) = _Success;
  const factory ProductsState.error(String message) = _Error;
}
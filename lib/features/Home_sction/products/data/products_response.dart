import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  final bool? success;
  final String? message;
  final ProductsData? data;

  ProductsResponse({
    this.success,
    this.message,
    this.data,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
@JsonSerializable()
class ProductsData {
  final List<ProductModel>? items;
  final MetaModel? meta;

  ProductsData({
    this.items,
    this.meta,
  });

  factory ProductsData.fromJson(Map<String, dynamic> json) =>
      _$ProductsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsDataToJson(this);
}
@JsonSerializable()
class MetaModel {
  @JsonKey(name: 'current_page')
  final int? currentPage;

  @JsonKey(name: 'last_page')
  final int? lastPage;

  @JsonKey(name: 'per_page')
  final int? perPage;

  final int? total;

  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;

  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;

  MetaModel({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MetaModelToJson(this);
}
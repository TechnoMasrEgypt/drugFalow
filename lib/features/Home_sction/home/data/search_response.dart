
import 'package:json_annotation/json_annotation.dart';
 
part 'search_response.g.dart';
 
@JsonSerializable()
class SearchResponse {
  final bool success;
  final String message;
  final SearchData data;
 
  const SearchResponse({
    required this.success,
    required this.message,
    required this.data,
  });
 
  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}
 
@JsonSerializable()
class SearchData {
  final List<SearchWarehouse> warehouses; // ← added
  final List<SearchProductModel> products;
 
  const SearchData({
    required this.warehouses,
    required this.products,
  });
 
  factory SearchData.fromJson(Map<String, dynamic> json) =>
      _$SearchDataFromJson(json);
}
 
@JsonSerializable()
class SearchProductModel {
  final int id;
  final String name;
  final String? image;
  final String price;
 
  @JsonKey(name: 'price_before_discount')
  final String? priceBeforeDiscount;
 
  @JsonKey(name: 'discount_percentage')
  final double? discountPercentage;
 
  @JsonKey(name: 'active_ingredients')
  final List<SearchIngredient> activeIngredients;
 
  final SearchWarehouse? warehouse;
 
  // convenience getter used in search results screen
  String? get category => null;
 
  const SearchProductModel({
    required this.id,
    required this.name,
    this.image,
    required this.price,
    this.priceBeforeDiscount,
    this.discountPercentage,
    required this.activeIngredients,
    this.warehouse,
  });
 
  factory SearchProductModel.fromJson(Map<String, dynamic> json) =>
      _$SearchProductModelFromJson(json);
}
 
@JsonSerializable()
class SearchIngredient {
  final int id;
  final String name;
 
  const SearchIngredient({required this.id, required this.name});
 
  factory SearchIngredient.fromJson(Map<String, dynamic> json) =>
      _$SearchIngredientFromJson(json);
}
 
@JsonSerializable()
class SearchWarehouse {
  final int id;
  final String name;
  final String? logo;
 
  const SearchWarehouse({required this.id, required this.name, this.logo});
 
  factory SearchWarehouse.fromJson(Map<String, dynamic> json) =>
      _$SearchWarehouseFromJson(json);
}
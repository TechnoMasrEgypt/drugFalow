// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: SearchData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

SearchData _$SearchDataFromJson(Map<String, dynamic> json) => SearchData(
  warehouses: (json['warehouses'] as List<dynamic>)
      .map((e) => SearchWarehouse.fromJson(e as Map<String, dynamic>))
      .toList(),
  products: (json['products'] as List<dynamic>)
      .map((e) => SearchProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SearchDataToJson(SearchData instance) =>
    <String, dynamic>{
      'warehouses': instance.warehouses,
      'products': instance.products,
    };

SearchProductModel _$SearchProductModelFromJson(Map<String, dynamic> json) =>
    SearchProductModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String?,
      price: json['price'] as String,
      priceBeforeDiscount: json['price_before_discount'] as String?,
      discountPercentage: (json['discount_percentage'] as num?)?.toDouble(),
      activeIngredients: (json['active_ingredients'] as List<dynamic>)
          .map((e) => SearchIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      warehouse: json['warehouse'] == null
          ? null
          : SearchWarehouse.fromJson(json['warehouse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchProductModelToJson(SearchProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'price_before_discount': instance.priceBeforeDiscount,
      'discount_percentage': instance.discountPercentage,
      'active_ingredients': instance.activeIngredients,
      'warehouse': instance.warehouse,
    };

SearchIngredient _$SearchIngredientFromJson(Map<String, dynamic> json) =>
    SearchIngredient(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$SearchIngredientToJson(SearchIngredient instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

SearchWarehouse _$SearchWarehouseFromJson(Map<String, dynamic> json) =>
    SearchWarehouse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$SearchWarehouseToJson(SearchWarehouse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };

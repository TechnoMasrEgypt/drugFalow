// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    ProductsResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ProductsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsResponseToJson(ProductsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

ProductsData _$ProductsDataFromJson(Map<String, dynamic> json) => ProductsData(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductsDataToJson(ProductsData instance) =>
    <String, dynamic>{'items': instance.items, 'meta': instance.meta};

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) => MetaModel(
  currentPage: (json['current_page'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
  perPage: (json['per_page'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  nextPageUrl: json['next_page_url'] as String?,
  prevPageUrl: json['prev_page_url'] as String?,
);

Map<String, dynamic> _$MetaModelToJson(MetaModel instance) => <String, dynamic>{
  'current_page': instance.currentPage,
  'last_page': instance.lastPage,
  'per_page': instance.perPage,
  'total': instance.total,
  'next_page_url': instance.nextPageUrl,
  'prev_page_url': instance.prevPageUrl,
};

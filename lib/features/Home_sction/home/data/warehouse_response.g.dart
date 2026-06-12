// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseResponse _$WarehouseResponseFromJson(Map<String, dynamic> json) =>
    WarehouseResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : WarehouseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WarehouseResponseToJson(WarehouseResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

WarehouseData _$WarehouseDataFromJson(Map<String, dynamic> json) =>
    WarehouseData(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => WarehouseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WarehouseDataToJson(WarehouseData instance) =>
    <String, dynamic>{'items': instance.items, 'meta': instance.meta};

WarehouseItem _$WarehouseItemFromJson(Map<String, dynamic> json) =>
    WarehouseItem(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$WarehouseItemToJson(WarehouseItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  currentPage: (json['current_page'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
  perPage: (json['per_page'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  nextPageUrl: json['next_page_url'] as String?,
  prevPageUrl: json['prev_page_url'] as String?,
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'current_page': instance.currentPage,
  'last_page': instance.lastPage,
  'per_page': instance.perPage,
  'total': instance.total,
  'next_page_url': instance.nextPageUrl,
  'prev_page_url': instance.prevPageUrl,
};

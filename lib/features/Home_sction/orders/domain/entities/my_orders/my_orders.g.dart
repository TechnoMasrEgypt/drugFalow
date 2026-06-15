// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyOrdersResponse _$MyOrdersResponseFromJson(Map<String, dynamic> json) =>
    MyOrdersResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      extra: json['extra'] as List<dynamic>?,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyOrdersResponseToJson(MyOrdersResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'extra': instance.extra,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
  id: (json['id'] as num).toInt(),
  orderCode: json['order_code'] as String,
  itemsCount: (json['items_count'] as num).toInt(),
  status: json['status'] as String,
  finalPrice: json['final_price'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
  'id': instance.id,
  'order_code': instance.orderCode,
  'items_count': instance.itemsCount,
  'status': instance.status,
  'final_price': instance.finalPrice,
  'created_at': instance.createdAt,
};

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  currentPage: (json['current_page'] as num).toInt(),
  lastPage: (json['last_page'] as num).toInt(),
  perPage: (json['per_page'] as num).toInt(),
  total: (json['total'] as num).toInt(),
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

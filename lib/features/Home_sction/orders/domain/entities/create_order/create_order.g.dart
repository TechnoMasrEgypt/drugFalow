// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderResponse _$CreateOrderResponseFromJson(Map<String, dynamic> json) =>
    CreateOrderResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CreateOrderData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateOrderResponseToJson(
  CreateOrderResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

CreateOrderData _$CreateOrderDataFromJson(Map<String, dynamic> json) =>
    CreateOrderData(
      id: (json['id'] as num?)?.toInt(),
      orderCode: json['order_code'] as String?,
      itemsCount: (json['items_count'] as num?)?.toInt(),
      status: json['status'] as String?,
      finalPrice: json['final_price'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$CreateOrderDataToJson(CreateOrderData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_code': instance.orderCode,
      'items_count': instance.itemsCount,
      'status': instance.status,
      'final_price': instance.finalPrice,
      'created_at': instance.createdAt,
    };

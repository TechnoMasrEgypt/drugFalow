// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderParams _$CreateOrderParamsFromJson(Map<String, dynamic> json) =>
    CreateOrderParams(
      cartId: (json['cart_id'] as num).toInt(),
      isDrafted: json['is_drafted'] as bool,
    );

Map<String, dynamic> _$CreateOrderParamsToJson(CreateOrderParams instance) =>
    <String, dynamic>{
      'cart_id': instance.cartId,
      'is_drafted': instance.isDrafted,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCartItemRequest _$UpdateCartItemRequestFromJson(
  Map<String, dynamic> json,
) => UpdateCartItemRequest(
  quantity: (json['quantity'] as num).toInt(),
  product_id: (json['product_id'] as num).toInt(),
);

Map<String, dynamic> _$UpdateCartItemRequestToJson(
  UpdateCartItemRequest instance,
) => <String, dynamic>{
  'quantity': instance.quantity,
  'product_id': instance.product_id,
};

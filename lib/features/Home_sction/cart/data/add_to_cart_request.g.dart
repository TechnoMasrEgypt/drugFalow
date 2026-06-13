// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartRequest _$AddToCartRequestFromJson(Map<String, dynamic> json) =>
    AddToCartRequest(
      product_id: json['product_id'] as String,
      quantity: json['quantity'] as String,
    );

Map<String, dynamic> _$AddToCartRequestToJson(AddToCartRequest instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'quantity': instance.quantity,
    };

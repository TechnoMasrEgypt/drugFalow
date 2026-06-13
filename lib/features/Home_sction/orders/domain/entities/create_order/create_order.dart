import 'package:json_annotation/json_annotation.dart';

part 'create_order.g.dart';

@JsonSerializable()
class CreateOrderResponse {
  final bool? success;
  final String? message;
  final CreateOrderData? data;

  CreateOrderResponse({
    this.success,
    this.message,
    this.data,
  });

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderResponseToJson(this);
}

@JsonSerializable()
class CreateOrderData {
  final int? id;

  @JsonKey(name: 'order_code')
  final String? orderCode;

  @JsonKey(name: 'items_count')
  final int? itemsCount;

  final String? status;

  @JsonKey(name: 'final_price')
  final String? finalPrice;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  CreateOrderData({
    this.id,
    this.orderCode,
    this.itemsCount,
    this.status,
    this.finalPrice,
    this.createdAt,
  });

  factory CreateOrderData.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderDataToJson(this);
}
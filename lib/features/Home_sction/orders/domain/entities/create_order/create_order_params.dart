import 'package:json_annotation/json_annotation.dart';

part 'create_order_params.g.dart';

@JsonSerializable()
class CreateOrderParams {
  @JsonKey(name: 'cart_id')
  final int cartId;

  @JsonKey(name: 'is_drafted')
  final bool isDrafted;

  const CreateOrderParams({
    required this.cartId,
    required this.isDrafted,
  });

  factory CreateOrderParams.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderParamsToJson(this);
}
import 'package:json_annotation/json_annotation.dart';

part 'update_cart_item_request.g.dart';

@JsonSerializable()
class UpdateCartItemRequest {
  final int quantity;
  final int product_id;

  const UpdateCartItemRequest({ required this.quantity ,required this.product_id});

  Map<String, dynamic> toJson() => _$UpdateCartItemRequestToJson(this);
}
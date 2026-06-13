// add_to_cart_response.dart
import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_request.g.dart';

 

@JsonSerializable()
class AddToCartRequest {
  final String product_id;
  final String quantity;

  AddToCartRequest({required this.product_id, required this.quantity});

  Map<String, dynamic> toJson() => _$AddToCartRequestToJson(this);
}
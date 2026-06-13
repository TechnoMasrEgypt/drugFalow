import 'package:json_annotation/json_annotation.dart';

part 'order_statuses_response.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderStatusesResponse {
  final bool success;
  final String message;
  final List<OrderStatusModel> data;

  OrderStatusesResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OrderStatusesResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$OrderStatusesResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OrderStatusesResponseToJson(this);
}

@JsonSerializable()
class OrderStatusModel {
  final String value;
  final String label;

  OrderStatusModel({
    required this.value,
    required this.label,
  });

  factory OrderStatusModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$OrderStatusModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OrderStatusModelToJson(this);
}
import 'package:json_annotation/json_annotation.dart';

part 'my_orders.g.dart';

@JsonSerializable(explicitToJson: true)
class MyOrdersResponse {
  final bool success;
  final String message;
  final List<dynamic>? extra;
  final List<OrderItem> items;
  final Meta meta;

  MyOrdersResponse({
    required this.success,
    required this.message,
    this.extra,
    required this.items,
    required this.meta,
  });

  factory MyOrdersResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MyOrdersResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MyOrdersResponseToJson(this);
}

@JsonSerializable()
class OrderItem {
  final int id;

  @JsonKey(name: 'order_code')
  final String orderCode;

  @JsonKey(name: 'items_count')
  final int itemsCount;

  final String status;

  @JsonKey(name: 'final_price')
  final String finalPrice;

  @JsonKey(name: 'created_at')
  final String createdAt;

  OrderItem({
    required this.id,
    required this.orderCode,
    required this.itemsCount,
    required this.status,
    required this.finalPrice,
    required this.createdAt,
  });

  factory OrderItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OrderItemToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: 'current_page')
  final int currentPage;

  @JsonKey(name: 'last_page')
  final int lastPage;

  @JsonKey(name: 'per_page')
  final int perPage;

  final int total;

  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;

  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;

  Meta({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory Meta.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MetaFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MetaToJson(this);
}
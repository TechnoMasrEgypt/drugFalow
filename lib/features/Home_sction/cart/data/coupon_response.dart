import 'package:json_annotation/json_annotation.dart';

part 'coupon_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CouponResponseModel {
  final bool success;
  final String message;
  final CouponDataModel data;

  CouponResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CouponResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CouponResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponResponseModelToJson(this);
}

/// ─────────────────────────────────────────────
/// DATA
/// ─────────────────────────────────────────────
@JsonSerializable(explicitToJson: true)
class CouponDataModel {
  final CouponModel coupon;

  @JsonKey(name: 'cart_summary')
  final CartSummaryModel cartSummary;

  CouponDataModel({
    required this.coupon,
    required this.cartSummary,
  });

  factory CouponDataModel.fromJson(Map<String, dynamic> json) =>
      _$CouponDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponDataModelToJson(this);
}

/// ─────────────────────────────────────────────
/// COUPON
/// ─────────────────────────────────────────────
@JsonSerializable()
class CouponModel {
  final String code;
  final String name;

  @JsonKey(name: 'discount_type')
  final String discountType;

  @JsonKey(name: 'discount_amount')
  final num discountAmount;

  @JsonKey(name: 'discount_display')
  final String discountDisplay;

  CouponModel({
    required this.code,
    required this.name,
    required this.discountType,
    required this.discountAmount,
    required this.discountDisplay,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponModelToJson(this);
}

/// ─────────────────────────────────────────────
/// CART SUMMARY
/// ─────────────────────────────────────────────
@JsonSerializable()
class CartSummaryModel {
  @JsonKey(name: 'sub_total')
  final num subTotal;

  final num discount;

  @JsonKey(name: 'order_fees')
  final num orderFees;

  @JsonKey(name: 'total_after_discount')
  final num totalAfterDiscount;

  CartSummaryModel({
    required this.subTotal,
    required this.discount,
    required this.orderFees,
    required this.totalAfterDiscount,
  });

  factory CartSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$CartSummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartSummaryModelToJson(this);
}
import 'package:json_annotation/json_annotation.dart';

part 'coupon_response.g.dart';

@JsonSerializable()
class CouponResponse {
  final bool success;
  final String message;
  final List<CouponModel> data;

  CouponResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CouponResponse.fromJson(Map<String, dynamic> json) =>
      _$CouponResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CouponResponseToJson(this);
}

@JsonSerializable()
class CouponModel {
  final int id;
  final String name;
  final String code;

  @JsonKey(name: 'discount_type')
  final String discountType;

  @JsonKey(name: 'discount_value')
  final String discountValue;

  @JsonKey(name: 'percentage_value')
  final String? percentageValue;

  @JsonKey(name: 'min_order_amount')
  final String minOrderAmount;

  @JsonKey(name: 'start_date')
  final String startDate;

  @JsonKey(name: 'end_date')
  final String endDate;

  @JsonKey(name: 'usage_limit')
  final int usageLimit;

  @JsonKey(name: 'used_count')
  final int usedCount;

  @JsonKey(name: 'is_active')
  final bool isActive;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  CouponModel({
    required this.id,
    required this.name,
    required this.code,
    required this.discountType,
    required this.discountValue,
    this.percentageValue,
    required this.minOrderAmount,
    required this.startDate,
    required this.endDate,
    required this.usageLimit,
    required this.usedCount,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponModelToJson(this);
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponResponse _$CouponResponseFromJson(Map<String, dynamic> json) =>
    CouponResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CouponModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CouponResponseToJson(CouponResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

CouponModel _$CouponModelFromJson(Map<String, dynamic> json) => CouponModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  code: json['code'] as String,
  discountType: json['discount_type'] as String,
  discountValue: json['discount_value'] as String,
  percentageValue: json['percentage_value'] as String?,
  minOrderAmount: json['min_order_amount'] as String,
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
  usageLimit: (json['usage_limit'] as num).toInt(),
  usedCount: (json['used_count'] as num).toInt(),
  isActive: json['is_active'] as bool,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$CouponModelToJson(CouponModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'discount_type': instance.discountType,
      'discount_value': instance.discountValue,
      'percentage_value': instance.percentageValue,
      'min_order_amount': instance.minOrderAmount,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'usage_limit': instance.usageLimit,
      'used_count': instance.usedCount,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

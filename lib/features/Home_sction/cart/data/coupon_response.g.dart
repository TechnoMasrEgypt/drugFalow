// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponResponseModel _$CouponResponseModelFromJson(Map<String, dynamic> json) =>
    CouponResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: CouponDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CouponResponseModelToJson(
  CouponResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data.toJson(),
};

CouponDataModel _$CouponDataModelFromJson(Map<String, dynamic> json) =>
    CouponDataModel(
      coupon: CouponModel.fromJson(json['coupon'] as Map<String, dynamic>),
      cartSummary: CartSummaryModel.fromJson(
        json['cart_summary'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CouponDataModelToJson(CouponDataModel instance) =>
    <String, dynamic>{
      'coupon': instance.coupon.toJson(),
      'cart_summary': instance.cartSummary.toJson(),
    };

CouponModel _$CouponModelFromJson(Map<String, dynamic> json) => CouponModel(
  code: json['code'] as String,
  name: json['name'] as String,
  discountType: json['discount_type'] as String,
  discountAmount: json['discount_amount'] as num,
  discountDisplay: json['discount_display'] as String,
);

Map<String, dynamic> _$CouponModelToJson(CouponModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'discount_type': instance.discountType,
      'discount_amount': instance.discountAmount,
      'discount_display': instance.discountDisplay,
    };

CartSummaryModel _$CartSummaryModelFromJson(Map<String, dynamic> json) =>
    CartSummaryModel(
      subTotal: json['sub_total'] as num,
      discount: json['discount'] as num,
      orderFees: json['order_fees'] as num,
      totalAfterDiscount: json['total_after_discount'] as num,
    );

Map<String, dynamic> _$CartSummaryModelToJson(CartSummaryModel instance) =>
    <String, dynamic>{
      'sub_total': instance.subTotal,
      'discount': instance.discount,
      'order_fees': instance.orderFees,
      'total_after_discount': instance.totalAfterDiscount,
    };

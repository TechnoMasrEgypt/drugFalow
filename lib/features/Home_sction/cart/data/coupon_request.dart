class ApplyCouponRequest {
  final String couponCode;
  final int cartId;

  ApplyCouponRequest({
    required this.couponCode,
    required this.cartId,
  });

  Map<String, dynamic> toJson() {
    return {
      "coupon_code": couponCode,
      "cart_id": cartId,
    };
  }
}
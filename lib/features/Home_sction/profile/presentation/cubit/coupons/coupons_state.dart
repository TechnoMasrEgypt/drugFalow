import 'package:drug_flow/features/Home_sction/profile/data/coupon_response.dart';

abstract class CouponsState {}

class CouponsInitial extends CouponsState {}

class CouponsLoading extends CouponsState {}

class CouponsSuccess extends CouponsState {
  final List<CouponModel> coupons;

  CouponsSuccess(this.coupons);
}

class CouponsError extends CouponsState {
  final String message;

  CouponsError(this.message);
}
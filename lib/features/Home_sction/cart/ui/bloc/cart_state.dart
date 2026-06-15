import 'package:drug_flow/features/Home_sction/cart/data/cart_response.dart';
import 'package:drug_flow/features/Home_sction/cart/data/coupon_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;

  const factory CartState.loading() = CartLoading;

  const factory CartState.success(CartResponseModel response) = CartSuccess;

  const factory CartState.error(String message) = CartError;

  const factory CartState.couponLoading() = CouponLoading;

  const factory CartState.couponSuccess(CouponResponseModel response) =
      CouponSuccess;

  const factory CartState.couponError(String message) = CouponError;

  const factory CartState.addToCartSuccess(CartResponseModel response) =
      AddToCartSuccess;

  const factory CartState.addToCartError(String message) = AddToCartError;
  const factory CartState.updateCartSuccess(CartResponseModel response) =
      UpdateCartSuccess;

  const factory CartState.updateCartError(String message) = UpdateCartError;
  const factory CartState.updating() = Updating; // NEW

  const factory CartState.deleteCartSuccess() = DeleteCartSuccess;
  const factory CartState.deleteWholeCartSuccess() = DeleteWholeCartSuccess;
  const factory CartState.deleteCartError(String message) = DeleteCartError;
  const factory CartState.deleteWholeCartError(String message) =
      DeleteWholeCartError;

  const factory CartState.saveCartAsDraftSuccess(CartResponseModel response) =
      SaveCartAsDraftSuccess;
  const factory CartState.saveCartAsDraftError(String message) =
      SaveCartAsDraftError;
}

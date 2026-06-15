import 'package:drug_flow/core/networking/api_error_handler.dart';
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/core/networking/api_services.dart';
import 'package:drug_flow/features/Home_sction/cart/data/SwapWarehouseRequest.dart';
import 'package:drug_flow/features/Home_sction/cart/data/add_to_cart_request.dart';
import 'package:drug_flow/features/Home_sction/cart/data/cart_response.dart';
import 'package:drug_flow/features/Home_sction/cart/data/coupon_request.dart';
import 'package:drug_flow/features/Home_sction/cart/data/coupon_response.dart';
import 'package:drug_flow/features/Home_sction/cart/data/update_cart_item_request.dart';

class CartRepos {
  final ApiService _apiService;

  CartRepos(this._apiService);

  Future<ApiResult<CartResponseModel>> getMyCart({
    required bool isDrafted,
  }) async {
    try {
      final response = await _apiService.getMyCarts(
        isDrafted: isDrafted ? 0 : 1,
      );

      return ApiResult.success(response);
    } catch (e, s) {
      print("CART ERROR: $e");
      print("STACK: $s");
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<CartResponseModel>> addToCart(AddToCartRequest body) async {
    try {
      final response = await _apiService.addToCart(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<CartResponseModel>> updateCartItem({
    required int id,
    required UpdateCartItemRequest body,
  }) async {
    try {
      final response = await _apiService.updateCartItem(id, body);
      return ApiResult.success(response);
    } catch (e, s) {
      print("SEARCH ERROR => $e");
      print(s);
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<CartResponseModel>> deleteCartItem(int id) async {
    try {
      final response = await _apiService.deleteCartItem(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<CartResponseModel>> deleteWholeCart(int id) async {
    try {
      final response = await _apiService.deleteWholeCart(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<CartResponseModel>> saveCartAsDraft(int id) async {
    try {
      final response = await _apiService.saveCartAsDraft(id, {"is_drafted": 1});

      return ApiResult.success(response);
    } catch (e, s) {
      print("SEARCH ERROR => $e");
      print(s);
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<CouponResponseModel>> applyCoupon(
    ApplyCouponRequest body,
  ) async {
    try {
      final response = await _apiService.applyCoupon(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<CartItemModel>> swapWarehouse(
    SwapWarehouseRequest body,
  ) async {
    try {
      final response = await _apiService.swapWarehouse(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
  // Future<ApiResult<CartResponse>> addToCart(AddToCartResponse body) async {
  //   try {
  //     final response = await _apiService.addToCart(body);
  //     return ApiResult.success(response);
  //   } catch (e) {
  //     return ApiResult.failure(ErrorHandler.handle(e));
  //   }
  // }


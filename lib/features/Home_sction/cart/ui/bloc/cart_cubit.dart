import 'dart:math';

import 'package:drug_flow/features/Home_sction/cart/data/SwapWarehouseRequest.dart';
import 'package:drug_flow/features/Home_sction/cart/data/coupon_request.dart';
import 'package:drug_flow/features/Home_sction/cart/data/coupon_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/features/Home_sction/cart/data/add_to_cart_request.dart';
import 'package:drug_flow/features/Home_sction/cart/data/cart_repos.dart';
import 'package:drug_flow/features/Home_sction/cart/data/cart_response.dart';
import 'package:drug_flow/features/Home_sction/cart/data/update_cart_item_request.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepos _repo;

  CartCubit(this._repo) : super(const CartState.initial());
List<CartItemModel>? cartItemModel;  CartResponseModel? cartResponse;

  // ─────────────────────────────────────────────
  // GET CART
  // ─────────────────────────────────────────────
  Future<void> getMyCart({required bool isDrafted, bool showLoading = true}) async {
     if (showLoading) emit(const CartState.loading());

    final result = await _repo.getMyCart(isDrafted: isDrafted);

    result.when(
      success: (data) {
        print("SUCCESS: $data");
        cartResponse = data;
        emit(CartState.success(data));
      },
      failure: (error) {
        print("FAILURE: ${error.apiErrorModel.message}");

        emit(
          CartState.error(
            error.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }

  // ─────────────────────────────────────────────
  // ADD TO CART
  // ─────────────────────────────────────────────
  Future<void> addToCart(AddToCartRequest body) async {
    emit(const CartState.updating());

    final result = await _repo.addToCart(body);

    result.when(
      success: (_) async {
        await getMyCart(isDrafted: true, showLoading: false);
      },
      failure: (error) {
        emit(
          CartState.addToCartError(
            error.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }CartItemModel getItemById(int id) {
  return cartItemModel!.firstWhere((e) => e.productId == id);
}

  // ─────────────────────────────────────────────
  // UPDATE ITEM
  // ─────────────────────────────────────────────
  Future<void> updateCartItem({
    required UpdateCartItemRequest body,
    required bool isDrafted,
    required int id,
  }) async {
    emit(const CartState.updating());

    final result = await _repo.updateCartItem(id: id, body: body);

    result.when(
      success: (_) async {
        await getMyCart(isDrafted: isDrafted, showLoading: false);
      },
      failure: (error) {
        emit(
          CartState.updateCartError(
            error.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }

  // ─────────────────────────────────────────────
  // DELETE ITEM
  // ─────────────────────────────────────────────
  Future<void> deleteCartItem({
    required int id,
    required bool isDrafted,
  }) async {
    emit(const CartState.updating());

    final result = await _repo.deleteCartItem(id);

    result.when(
      success: (_) async {
        await getMyCart(isDrafted: isDrafted, showLoading: false);
      },
      failure: (error) {
        emit(
          CartState.deleteCartError(
            error.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }

  // ─────────────────────────────────────────────
  // DELETE WHOLE CART
  // ─────────────────────────────────────────────
  Future<void> deleteWholeCart({
    required int id,
    required bool isDrafted,
  }) async {
    emit(const CartState.updating());

    final result = await _repo.deleteWholeCart(id);

    result.when(
      success: (_) async {
        await getMyCart(isDrafted: isDrafted, showLoading: false);
      },
      failure: (error) {
        emit(
          CartState.deleteWholeCartError(
            error.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }

  // ─────────────────────────────────────────────
  // SAVE AS DRAFT
  // ─────────────────────────────────────────────
  Future<void> saveCartAsDraft({required int id}) async {
    emit(const CartState.updating());

    final result = await _repo.saveCartAsDraft(id);

    result.when(
      success: (_) async {
        await getMyCart(isDrafted: true, showLoading: false);
      },
      failure: (error) {
        emit(
          CartState.saveCartAsDraftError(
            error.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }

  CouponResponseModel? couponResponse;

  Future<void> applyCoupon({required String code, required int cartId}) async {
    emit(CartState.couponLoading());

    final result = await _repo.applyCoupon(
      ApplyCouponRequest(couponCode: code, cartId: cartId),
    );

    result.when(
      success: (data) {
        couponResponse = data;
        emit(CartState.couponSuccess(data));
      },
      failure: (error) {
        emit(CartState.couponError(error.apiErrorModel.message ?? "Error"));
      },
    );
  }
  Future<void> swapWarehouse({
  required int medicineId,
  required int oldWarehouseId,
  required int productId,
  required int newWarehouseId,
  required bool isDrafted,
}) async {
    emit(const CartState.updating());

  final result = await _repo.swapWarehouse(
    SwapWarehouseRequest(
      medicineId: medicineId,
      oldWarehouseId: oldWarehouseId,
      productId: productId,
      newWarehouseId: newWarehouseId,
    ),
  );

  result.when(
    success: (_) async {
      await getMyCart(isDrafted: isDrafted, showLoading: false);
      
    },
    failure: (error) {
      emit(
        CartState.error(
          error.apiErrorModel.message ?? "Something went wrong",
        ),
      );
    },
  );
}
}

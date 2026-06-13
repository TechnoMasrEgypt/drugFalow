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

  CartResponseModel? cartResponse;

  // ─────────────────────────────────────────────
  // GET CART
  // ─────────────────────────────────────────────
  Future<void> getMyCart({required bool isDrafted}) async {
    emit(const CartState.loading());

    final result = await _repo.getMyCart(isDrafted: isDrafted);

    result.when(
      success: (data) {
        cartResponse = data;
        emit(CartState.success(data));
      },
      failure: (error) {
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
        await getMyCart(isDrafted: true);
      },
      failure: (error) {
        emit(
          CartState.addToCartError(
            error.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
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

    final result = await _repo.updateCartItem(
      id: id,
      body: body,
    );

    result.when(
      success: (_) async {
        await getMyCart(isDrafted: isDrafted);
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
        await getMyCart(isDrafted: isDrafted);
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
        await getMyCart(isDrafted: isDrafted);
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
        await getMyCart(isDrafted: true);
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
}
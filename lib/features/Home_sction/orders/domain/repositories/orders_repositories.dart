import 'package:drug_flow/core/networking/api_error_handler.dart';
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/core/networking/api_services.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/order_details/order_statuses_response.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/create_order/create_order.dart';
import '../entities/create_order/create_order_params.dart';
import 'package:dartz/dartz.dart';

import '../entities/create_review/create_review.dart';
import '../entities/create_review/create_review_params.dart';
import '../entities/my_orders/my_orders.dart';
import '../entities/my_orders/my_orders_params.dart';
import '../entities/order_details/order_details_params.dart';
import '../entities/order_details/orders_details.dart';
class OrdersRepo {
  final ApiService _apiService;

  OrdersRepo(this._apiService);

  Future<ApiResult<CreateOrderResponse>> createOrder(
    CreateOrderParams body,
  ) async {
    try {
      final response = await _apiService.createOrder(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<CreateReviewResponse>> createReview(
    CreateReviewParams body,
  ) async {
    try {
      final response = await _apiService.createReview(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<MyOrdersResponse>> getMyOrders() async {
    try {
      final response = await _apiService.getMyOrders();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
Future<ApiResult<OrderStatusesResponse>>
    getOrderStatuses() async {
  try {
    final response =
        await _apiService.getOrderStatuses();

    return ApiResult.success(response);
  } catch (e) {
    return ApiResult.failure(
      ErrorHandler.handle(e),
    );
  }
}
  Future<ApiResult<OrderDetailsResponse>> getOrderDetails(int id) async {
    try {
      final response = await _apiService.getOrderDetails(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
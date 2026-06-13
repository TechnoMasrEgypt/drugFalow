
import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_order/create_order.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_review/create_review.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/my_orders/my_orders.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/order_details/order_statuses_response.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/order_details/orders_details.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/cubit/orders/orders_state.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/cubit/orders/orders_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_state.freezed.dart';
@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;
  const factory OrdersState.loading() = OrdersLoading;

  const factory OrdersState.success(MyOrdersResponse data) = OrdersSuccess;

  const factory OrdersState.createOrderSuccess(CreateOrderResponse data) =
      CreateOrderSuccess;

  const factory OrdersState.createOrderError(String message) =
      CreateOrderError;

  const factory OrdersState.createReviewSuccess(CreateReviewResponse data) =
      CreateReviewSuccess;

  const factory OrdersState.createReviewError(String message) =
      CreateReviewError;

  const factory OrdersState.orderDetailsSuccess(OrderDetailsResponse data) =
      OrderDetailsSuccess;

  const factory OrdersState.orderStatusesSuccess(OrderStatusesResponse data) =
      OrderStatusesSuccess;
const factory OrdersState.orderStatusesError(String message) = OrderStatusesError;

  const factory OrdersState.orderDetailsError(String message) =
      OrderDetailsError;

  const factory OrdersState.error(String message) = OrdersError;
}
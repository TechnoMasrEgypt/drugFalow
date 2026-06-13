import 'package:bloc/bloc.dart';
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_order/create_order.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_order/create_order_params.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_review/create_review.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_review/create_review_params.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/my_orders/my_orders.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/order_details/order_statuses_response.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/order_details/orders_details.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/repositories/orders_repositories.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/cubit/orders/orders_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo _repo;

  OrdersCubit(this._repo) : super(const OrdersState.initial());

  MyOrdersResponse? myOrders;

  Future<void> getMyOrders() async {
    emit(const OrdersState.loading());

    final result = await _repo.getMyOrders();

    result.when(
      success: (data) {
        myOrders = data;
        emit(OrdersState.success(data));
      },
      failure: (error) {
        emit(
          OrdersState.error(
            error.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }

  Future<void> createOrder(CreateOrderParams body) async {
    emit(const OrdersState.loading());

    final result = await _repo.createOrder(body);

    result.when(
      success: (data) {
        emit(OrdersState.createOrderSuccess(data));
      },
      failure: (error) {
        emit(
          OrdersState.createOrderError(
            error.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }
  OrderStatusesResponse? statusesResponse;

Future<void> getOrderStatuses() async {
  final result = await _repo.getOrderStatuses();

  result.when(
    success: (data) {
      statusesResponse = data;

      emit(
        OrdersState.orderStatusesSuccess(
          data,
        ),
      );
    },
    failure: (error) {
      emit(
        OrdersState.orderStatusesError(
          error.apiErrorModel.message ??
              'Something went wrong',
        ),
      );
    },
  );
}

  Future<void> createReview(CreateReviewParams body) async {
    final result = await _repo.createReview(body);

    result.when(
      success: (data) {
        emit(OrdersState.createReviewSuccess(data));
      },
      failure: (error) {
        emit(
          OrdersState.createReviewError(
            error.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }

  Future<void> getOrderDetails(int id) async {
    emit(const OrdersState.loading());

    final result = await _repo.getOrderDetails(id);

    result.when(
      success: (data) {
        emit(OrdersState.orderDetailsSuccess(data));
      },
      failure: (error) {
        emit(
          OrdersState.orderDetailsError(
            error.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }
}
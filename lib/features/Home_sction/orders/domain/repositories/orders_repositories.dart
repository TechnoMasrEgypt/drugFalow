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

abstract class OrdersRepositories {
  Future<Either<Failure,CreateOrderResponse>>createOrder({CreateOrderParams? params});
  Future<Either<Failure,CreateReviewResponse>>createReview({CreateReviewParams? params});
  Future<Either<Failure,MyOrdersResponse>>getMyOrders({MyOrdersParams? params});
  Future<Either<Failure,OrderDetailsResponse>>getOrderDetails({OrderDetailsParams? params});
}
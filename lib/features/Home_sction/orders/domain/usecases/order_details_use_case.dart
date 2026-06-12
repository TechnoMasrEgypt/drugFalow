import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/order_details/order_details_params.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/order_details/orders_details.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/repositories/orders_repositories.dart';

class OrderDetailsUseCase extends UseCase<OrderDetailsResponse,OrderDetailsParams>{
  final OrdersRepositories ordersRepositories;


  OrderDetailsUseCase(this.ordersRepositories);

  @override
  Future<Either<Failure, OrderDetailsResponse>> call(OrderDetailsParams params)async {
   return await ordersRepositories.getOrderDetails(params: params);
  }
}
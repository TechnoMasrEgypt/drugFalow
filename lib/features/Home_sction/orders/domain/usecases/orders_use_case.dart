import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/my_orders/my_orders.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/my_orders/my_orders_params.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/repositories/orders_repositories.dart';

class OrdersUseCase extends UseCase<MyOrdersResponse,MyOrdersParams>{
  final OrdersRepositories ordersRepositories;

  OrdersUseCase(this.ordersRepositories);

  @override
  Future<Either<Failure, MyOrdersResponse>> call(MyOrdersParams params)async {
   return await ordersRepositories.getMyOrders(params: params);
  }
}
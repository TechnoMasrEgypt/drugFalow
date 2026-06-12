import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_order/create_order.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_order/create_order_params.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/repositories/orders_repositories.dart';

class CreateOrderUseCase extends UseCase<CreateOrderResponse,CreateOrderParams>{
  final OrdersRepositories ordersRepositories;


  CreateOrderUseCase(this.ordersRepositories);

  @override
  Future<Either<Failure, CreateOrderResponse>> call(CreateOrderParams params)async {
    return await ordersRepositories.createOrder(params: params);
  }
}
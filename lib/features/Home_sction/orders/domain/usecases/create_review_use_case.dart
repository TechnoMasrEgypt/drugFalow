import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_review/create_review.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_review/create_review_params.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/repositories/orders_repositories.dart';

class CreateReviewUseCase extends UseCase<CreateReviewResponse,CreateReviewParams>{
  final OrdersRepositories ordersRepositories;

  CreateReviewUseCase(this.ordersRepositories);

  @override
  Future<Either<Failure, CreateReviewResponse>> call(CreateReviewParams params) async{
    return await ordersRepositories.createReview(params: params);
  }
}
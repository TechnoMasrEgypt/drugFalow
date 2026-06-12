import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Home_sction/products/domain/entities/product_details/product_details_params.dart';
import 'package:drug_flow/features/Home_sction/products/domain/entities/product_details/product_details_response.dart';
import 'package:drug_flow/features/Home_sction/products/domain/repositories/products_repositories.dart';

class ProductsDetailsUseCase extends UseCase<ProductDetailsResponse,ProductDetailsParams>{
  final ProductsRepositories productsRepositories;


  ProductsDetailsUseCase(this.productsRepositories);

  @override
  Future<Either<Failure, ProductDetailsResponse>> call(ProductDetailsParams params)async {
    return await productsRepositories.getProductDetails(params: params);
  }
}
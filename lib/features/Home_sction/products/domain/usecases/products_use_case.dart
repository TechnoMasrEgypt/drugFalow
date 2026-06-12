import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:drug_flow/features/Home_sction/products/data/products_response.dart';
import 'package:drug_flow/features/Home_sction/products/domain/entities/products/products_params.dart';
import 'package:drug_flow/features/Home_sction/products/domain/repositories/products_repositories.dart';

class ProductsUseCase extends UseCase<ProductModel,ProductsParams>{
  final ProductsRepositories productsRepositories;


  ProductsUseCase(this.productsRepositories);

  @override
  Future<Either<Failure, ProductModel>> call(ProductsParams params)async {
    return await productsRepositories.getProducts(params: params);
  }
}
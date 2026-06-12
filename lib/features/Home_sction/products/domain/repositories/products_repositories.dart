import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:drug_flow/features/Home_sction/products/data/products_response.dart';
import 'package:dartz/dartz.dart';
import '../entities/product_details/product_details_params.dart';
import '../entities/product_details/product_details_response.dart';
import '../entities/products/products_params.dart';

abstract class ProductsRepositories {
  Future<Either<Failure,ProductModel>>getProducts({ProductsParams? params});
  Future<Either<Failure,ProductDetailsResponse>>getProductDetails({ProductDetailsParams? params});
}
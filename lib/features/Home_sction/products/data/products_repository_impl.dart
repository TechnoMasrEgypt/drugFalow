// import 'package:dartz/dartz.dart';
// import 'package:drug_flow/core/errors/failure.dart';
// import 'package:drug_flow/features/Home_sction/products/data/products_remote_data_source_impl.dart';
// import 'package:drug_flow/features/Home_sction/products/domain/entities/product_details/product_details_params.dart';
// import 'package:drug_flow/features/Home_sction/products/domain/entities/product_details/product_details_response.dart';
// import 'package:drug_flow/features/Home_sction/products/domain/entities/products/products_params.dart';
// import 'package:drug_flow/features/Home_sction/products/domain/entities/products/products_response.dart';
// import 'package:drug_flow/features/Home_sction/products/domain/repositories/products_repositories.dart';

// import '../../../../core/errors/exceptions.dart';

// class ProductsRepositoryImpl implements ProductsRepositories{
//   final ProductsRemoteDataSource productsRemoteDataSource;


//   ProductsRepositoryImpl(this.productsRemoteDataSource);

//   @override
//   Future<Either<Failure, ProductDetailsResponse>> getProductDetails({ProductDetailsParams? params}) async{
//     try{
//       final response = await productsRemoteDataSource.getProductDetails(params: params);
//       return Right(response);
//     }on ServerException catch(e){
//       return left(ServerFailure(message: e.message));
//     }on UnAuthorizedException catch(e){
//       return left(ServerFailure(message: e.message));
//     }on UnprocessableContentException catch(e){
//       return left(ServerFailure(message: e.message));
//     }
//   }

//   @override
//   Future<Either<Failure, ProductsResponse>> getProducts({ProductsParams? params}) async{
//     try{
//       final response = await productsRemoteDataSource.getProducts(params: params);
//       return Right(response);
//     }on ServerException catch(e){
//       return left(ServerFailure(message: e.message));
//     }on UnAuthorizedException catch(e){
//       return left(ServerFailure(message: e.message));
//     }on UnprocessableContentException catch(e){
//       return left(ServerFailure(message: e.message));
//     }
//   }
// }
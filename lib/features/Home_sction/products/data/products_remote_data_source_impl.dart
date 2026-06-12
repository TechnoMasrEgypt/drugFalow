// import 'package:drug_flow/core/utils/api_base_helper.dart';
// import 'package:drug_flow/features/Home_sction/products/domain/entities/product_details/product_details_params.dart';
// import 'package:drug_flow/features/Home_sction/products/domain/entities/product_details/product_details_response.dart';
// import 'package:drug_flow/features/Home_sction/products/domain/entities/products/products_params.dart';
// import 'package:drug_flow/features/Home_sction/products/domain/entities/products/products_response.dart';
// import 'package:dio/dio.dart';

// import '../../../../core/errors/exceptions.dart';

// const productsApi = "/products";
// const productDetailsApi = "/products/";

// abstract class ProductsRemoteDataSource {
//   Future<ProductsResponse>getProducts({ProductsParams? params});
//   Future<ProductDetailsResponse>getProductDetails({ProductDetailsParams? params});
// }
// class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource{
//   final ApiBaseHelper helper;


//   ProductsRemoteDataSourceImpl(this.helper);

//   @override
//   Future<ProductsResponse> getProducts({ProductsParams? params}) async{
//     try {
//       final response = await helper.get(url: productsApi, query: {
//         "category_id" : params!.categoryId,
//         "search" : params.search,
//         "active_ingredient_id" : params.activeIngredientId,
//         "warehouse_id" : params.warehouseId,
//         "sort_price" : params.sortPrice
//       });
//       return ProductsResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//   @override
//   Future<ProductDetailsResponse> getProductDetails({ProductDetailsParams? params})async {
//     try {
//       final response = await helper.get(url: '$productDetailsApi${params!.productId}',);
//       return ProductDetailsResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

// }
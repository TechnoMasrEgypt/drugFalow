// import 'package:dartz/dartz.dart';
// import 'package:drug_flow/core/errors/failure.dart';
// import 'package:drug_flow/features/Home_sction/orders/data/orders_remote_data_source_impl.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_order/create_order.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_order/create_order_params.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_review/create_review.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_review/create_review_params.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/entities/my_orders/my_orders.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/entities/my_orders/my_orders_params.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/entities/order_details/order_details_params.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/entities/order_details/orders_details.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/repositories/orders_repositories.dart';

// import '../../../../core/errors/exceptions.dart';

// class OrdersRepositoryImpl implements OrdersRepositories{
//   final OrdersRemoteDataSource ordersRemoteDataSource;


//   OrdersRepositoryImpl(this.ordersRemoteDataSource);

//   @override
//   Future<Either<Failure, CreateOrderResponse>> createOrder({CreateOrderParams? params}) async{
//     try{
//       final response = await ordersRemoteDataSource.createOrder(params: params);
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
//   Future<Either<Failure, CreateReviewResponse>> createReview({CreateReviewParams? params}) async{
//     try{
//       final response = await ordersRemoteDataSource.createReview(params: params);
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
//   Future<Either<Failure, MyOrdersResponse>> getMyOrders({MyOrdersParams? params})async {
//     try{
//       final response = await ordersRemoteDataSource.getMyOrders(params: params);
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
//   Future<Either<Failure, OrderDetailsResponse>> getOrderDetails({OrderDetailsParams? params}) async{
//     try{
//       final response = await ordersRemoteDataSource.getOrderDetails(params: params);
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
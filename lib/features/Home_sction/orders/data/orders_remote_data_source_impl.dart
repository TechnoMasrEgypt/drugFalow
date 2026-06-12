// import 'package:drug_flow/core/utils/api_base_helper.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_order/create_order.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_order/create_order_params.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_review/create_review.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_review/create_review_params.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/entities/my_orders/my_orders.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/entities/my_orders/my_orders_params.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/entities/order_details/order_details_params.dart';
// import 'package:dio/dio.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/entities/order_details/orders_details.dart';

// import '../../../../core/errors/exceptions.dart';

// const createOrderApi = "/orders/confirm";
// const createReviewApi = "/orders/review";
// const myOrdersApi = "/orders/my-orders";
// const orderDetailsApi = "/orders/";

// abstract class OrdersRemoteDataSource {
//   Future<CreateOrderResponse>createOrder({CreateOrderParams? params});
//   Future<CreateReviewResponse>createReview({CreateReviewParams? params});
//   Future<MyOrdersResponse>getMyOrders({MyOrdersParams? params});
//   Future<OrderDetailsResponse>getOrderDetails({OrderDetailsParams? params});
// }
// class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource{
//   final ApiBaseHelper helper;


//   OrdersRemoteDataSourceImpl(this.helper);

//   @override
//   Future<CreateOrderResponse> createOrder({CreateOrderParams? params}) async{
//     try {
//       final formData = FormData.fromMap({
//         ...params!.toMap(),
//       });
//       final response = await helper.post(url: createOrderApi,formData: formData);
//       return CreateOrderResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//   @override
//   Future<CreateReviewResponse> createReview({CreateReviewParams? params}) async{
//     try {
//       final formData = FormData.fromMap({
//         ...params!.toMap(),
//       });
//       final response = await helper.post(url: createReviewApi,formData: formData);
//       return CreateReviewResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//   @override
//   Future<MyOrdersResponse> getMyOrders({MyOrdersParams? params}) async{
//     try {

//       final response = await helper.get(url: myOrdersApi,query: {
//         "status" :params!.status
//       });
//       return MyOrdersResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//   @override
//   Future<OrderDetailsResponse> getOrderDetails({OrderDetailsParams? params}) async{
//     try {

//       final response = await helper.get(url: '$orderDetailsApi${params!.orderId}',);
//       return OrderDetailsResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }
// }
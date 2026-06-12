// import 'package:drug_flow/features/Home_sction/orders/data/orders_remote_data_source_impl.dart';
// import 'package:drug_flow/features/Home_sction/orders/data/orders_repository_impl.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/repositories/orders_repositories.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/usecases/create_order_use_case.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/usecases/create_review_use_case.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/usecases/order_details_use_case.dart';
// import 'package:drug_flow/features/Home_sction/orders/domain/usecases/orders_use_case.dart';
// import 'package:drug_flow/features/Home_sction/orders/presentation/cubit/create_order/create_order_cubit.dart';
// import 'package:drug_flow/features/Home_sction/orders/presentation/cubit/create_review/create_review_cubit.dart';
// import 'package:drug_flow/features/Home_sction/orders/presentation/cubit/order_details/order_details_cubit.dart';
// import 'package:drug_flow/features/Home_sction/orders/presentation/cubit/orders/orders_cubit.dart';
// import 'package:get_it/get_it.dart';

// Future<void>initOrdersInj(GetIt s)async{
//   s.registerFactory(()=>OrdersCubit(s()));
//   s.registerFactory(()=>OrderDetailsCubit(s()));
//   s.registerFactory(()=>CreateOrderCubit(s()));
//   s.registerFactory(()=>CreateReviewCubit(s()));
  
  
//   s.registerLazySingleton<OrdersRemoteDataSource>(()=>OrdersRemoteDataSourceImpl(s()));
//   s.registerLazySingleton<OrdersRepositories>(()=>OrdersRepositoryImpl(s()));

//   s.registerLazySingleton(()=>OrdersUseCase(s()));
//   s.registerLazySingleton(()=>OrderDetailsUseCase(s()));
//   s.registerLazySingleton(()=>CreateOrderUseCase(s()));
//   s.registerLazySingleton(()=>CreateReviewUseCase(s()));
// }
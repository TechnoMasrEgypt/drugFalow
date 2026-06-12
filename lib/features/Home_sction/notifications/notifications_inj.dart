// import 'package:drug_flow/features/Home_sction/notifications/data/notifications_remote_data_source_impl.dart';
// import 'package:drug_flow/features/Home_sction/notifications/data/notifications_repository_impl.dart';
// import 'package:drug_flow/features/Home_sction/notifications/domain/repositories/notifications_repositories.dart';
// import 'package:drug_flow/features/Home_sction/notifications/domain/usecases/delete_notifications_use_case.dart';
// import 'package:drug_flow/features/Home_sction/notifications/domain/usecases/mark_all_as_read_use_case.dart';
// import 'package:drug_flow/features/Home_sction/notifications/domain/usecases/mark_as_read_use_case.dart';
// import 'package:drug_flow/features/Home_sction/notifications/domain/usecases/notifications_use_case.dart';
// import 'package:drug_flow/features/Home_sction/notifications/domain/usecases/un_read_count_notifications_use_case.dart';
// import 'package:drug_flow/features/Home_sction/notifications/presentation/cubit/mark_all_read/mark_all_read_cubit.dart';
// import 'package:drug_flow/features/Home_sction/notifications/presentation/cubit/mark_as_read/mark_as_read_cubit.dart';
// import 'package:drug_flow/features/Home_sction/notifications/presentation/cubit/notifications/notifications_cubit.dart';
// import 'package:drug_flow/features/Home_sction/notifications/presentation/cubit/unread_notifications_count/un_read_notifications_count_cubit.dart';
// import 'package:get_it/get_it.dart';

// Future<void>initNotificationsInj(GetIt s)async{
  
//   s.registerFactory(()=>NotificationsCubit(s()));
//   s.registerFactory(()=>MarkAllReadCubit(s()));
//   s.registerFactory(()=>MarkAsReadCubit(s()));
//   s.registerFactory(()=>UnReadNotificationsCountCubit(s()));

//   s.registerLazySingleton<NotificationsRemoteDataSource>(()=>NotificationsRemoteDataSourceImpl(s()));
//   s.registerLazySingleton<NotificationsRepositories>(()=>NotificationsRepositoryImpl(s()));
  
//   s.registerLazySingleton(()=>DeleteNotificationsUseCase(s()));
//   s.registerLazySingleton(()=>MarkAllAsReadUseCase(s()));
//   s.registerLazySingleton(()=>MarkAsReadUseCase(s()));
//   s.registerLazySingleton(()=>UnReadCountNotificationsUseCase(s()));
//   s.registerLazySingleton(()=>NotificationsUseCase(s()));


// }
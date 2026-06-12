// import 'package:dartz/dartz.dart';
// import 'package:drug_flow/core/errors/failure.dart';
// import 'package:drug_flow/features/Home_sction/notifications/domain/entities/delete_notifications_response.dart';
// import 'package:drug_flow/features/Home_sction/notifications/domain/entities/mark_as_read_response.dart';
// import 'package:drug_flow/features/Home_sction/notifications/domain/entities/notification_params.dart';
// import 'package:drug_flow/features/Home_sction/notifications/domain/entities/notifications_response.dart';
// import 'package:drug_flow/features/Home_sction/notifications/domain/entities/un_read_count_notifications_response.dart';
// import 'package:drug_flow/features/Home_sction/notifications/domain/repositories/notifications_repositories.dart';

// import '../../../../core/errors/exceptions.dart';
// import 'notifications_remote_data_source_impl.dart';

// class NotificationsRepositoryImpl implements NotificationsRepositories{
//   final NotificationsRemoteDataSource notificationsRemoteDataSource;

//   NotificationsRepositoryImpl(this.notificationsRemoteDataSource);

//   @override
//   Future<Either<Failure, NotificationsResponse>> getNotifications({NotificationParams? params}) async{
//     try{
//       final response = await notificationsRemoteDataSource.getNotifications(params: params!);
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
//   Future<Either<Failure, DeleteNotificationResponse>> deleteNotification({NotificationParams? params})async {
//     try{
//       final response = await notificationsRemoteDataSource.deleteNotification(params: params);
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
//   Future<Either<Failure, MarkAsReadResponse>> markAllAsRead() async{
//     try{
//       final response = await notificationsRemoteDataSource.markAllAsRead();
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
//   Future<Either<Failure, MarkAsReadResponse>> markAsRead({NotificationParams? params}) async{
//     try{
//       final response = await notificationsRemoteDataSource.markAsRead(params: params);
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
//   Future<Either<Failure, UnReadCountNotificationResponse>> getUnReadCountNotifications() async{
//     try{
//       final response = await notificationsRemoteDataSource.getUnReadCountNotifications();
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
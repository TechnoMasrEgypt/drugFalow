// import '../../../../core/errors/exceptions.dart';
// import '../../../../core/utils/api_base_helper.dart';
// import '../domain/entities/delete_notifications_response.dart';
// import '../domain/entities/mark_as_read_response.dart';
// import 'package:dio/dio.dart';

// import '../domain/entities/notification_params.dart';
// import '../domain/entities/notifications_response.dart';
// import '../domain/entities/un_read_count_notifications_response.dart';


// const notificationsApi = "/custom-notifications";
// const newNotificationsApi = "/custom-notifications/new";

// const markAsReadNotificationApi = "/custom-notifications/mark-read/3";

// const markAllReadNotificationsApi = "/custom-notifications/mark-all-read";
// const deleteNotificationApi = "/custom-notifications/3";

// const unReadNotificationsApi = "/custom-notifications/unread-count";


// abstract class NotificationsRemoteDataSource {
//   Future<NotificationsResponse>getNotifications({NotificationParams? params});
//  // Future<NotificationsResponse>getNewNotifications({NotificationParams? params});
//   Future<UnReadCountNotificationResponse>getUnReadCountNotifications();
//   Future<DeleteNotificationResponse>deleteNotification({NotificationParams? params});
//   Future<MarkAsReadResponse>markAsRead({NotificationParams? params});
//   Future<MarkAsReadResponse>markAllAsRead();
// }
// class NotificationsRemoteDataSourceImpl implements NotificationsRemoteDataSource {
//   final ApiBaseHelper helper;


//   NotificationsRemoteDataSourceImpl(this.helper);

//   @override
//   Future<NotificationsResponse> getNotifications({NotificationParams? params}) async {
//     try {
//       final response = await helper.get(url: notificationsApi,query: {
//         "page" : params!.page
//       });
//       return NotificationsResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//   @override
//   Future<UnReadCountNotificationResponse> getUnReadCountNotifications() async {
//     try {
//       final response = await helper.get(url: unReadNotificationsApi,);
//       return UnReadCountNotificationResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//   @override
//   Future<DeleteNotificationResponse> deleteNotification(
//       {NotificationParams? params}) async {
//     try {
//       final response = await helper.delete(url: "$deleteNotificationApi${params!.notificationsId}",);
//       return DeleteNotificationResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//   @override
//   Future<MarkAsReadResponse> markAsRead({NotificationParams? params})async {
//     try {
//       final formData = FormData.fromMap({});
//       final response = await helper.post(url: "$markAsReadNotificationApi${params!.notificationsId}",
//           formData: formData);
//       return MarkAsReadResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//   @override
//   Future<MarkAsReadResponse> markAllAsRead() async{
//     try {
//       final formData = FormData.fromMap({});
//       final response = await helper.post(url: markAllReadNotificationsApi, formData: formData);
//       return MarkAsReadResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//  /* @override
//   Future<NotificationsResponse> getNewNotifications({NotificationParams? params})async {
//     try {
//       final formData = FormData.fromMap({});
//       final response = await helper.get(url: newNotificationsApi, query: {
//         "last_id" : params!.lastId
//       } );
//       return NotificationsResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }*/
// }
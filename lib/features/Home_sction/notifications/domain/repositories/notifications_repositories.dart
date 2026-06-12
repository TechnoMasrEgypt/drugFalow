import 'package:drug_flow/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../entities/delete_notifications_response.dart';
import '../entities/mark_as_read_response.dart';
import '../entities/notification_params.dart';
import '../entities/notifications_response.dart';
import '../entities/un_read_count_notifications_response.dart';

abstract class NotificationsRepositories {
  Future<Either<Failure,NotificationsResponse>>getNotifications({NotificationParams? params});

  // Future<NotificationsResponse>getNewNotifications({NotificationParams? params});
  Future<Either<Failure,UnReadCountNotificationResponse>>getUnReadCountNotifications();
  Future<Either<Failure,DeleteNotificationResponse>>deleteNotification({NotificationParams? params});
  Future<Either<Failure,MarkAsReadResponse>>markAsRead({NotificationParams? params});
  Future<Either<Failure,MarkAsReadResponse>>markAllAsRead();
}
import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Home_sction/notifications/domain/entities/delete_notifications_response.dart';
import 'package:drug_flow/features/Home_sction/notifications/domain/entities/notification_params.dart';
import 'package:drug_flow/features/Home_sction/notifications/domain/repositories/notifications_repositories.dart';

class DeleteNotificationsUseCase extends UseCase<DeleteNotificationResponse,
    NotificationParams>{
  final NotificationsRepositories notificationsRepositories;

  DeleteNotificationsUseCase(this.notificationsRepositories);

  @override
  Future<Either<Failure, DeleteNotificationResponse>> call(NotificationParams params)async {
    return await notificationsRepositories.deleteNotification(params: params);
  }
}
import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Home_sction/notifications/domain/entities/notification_params.dart';
import 'package:drug_flow/features/Home_sction/notifications/domain/entities/notifications_response.dart';
import 'package:drug_flow/features/Home_sction/notifications/domain/repositories/notifications_repositories.dart';

class NotificationsUseCase extends UseCase<NotificationsResponse,NotificationParams>{
  final NotificationsRepositories notificationsRepositories;

  NotificationsUseCase(this.notificationsRepositories);

  @override
  Future<Either<Failure, NotificationsResponse>> call(NotificationParams params)async {
    return await notificationsRepositories.getNotifications(params: params);
  }
}
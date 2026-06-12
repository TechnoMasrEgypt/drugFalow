import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Home_sction/notifications/domain/entities/un_read_count_notifications_response.dart';
import 'package:drug_flow/features/Home_sction/notifications/domain/repositories/notifications_repositories.dart';

class UnReadCountNotificationsUseCase extends UseCase<UnReadCountNotificationResponse
,NoParams>{
  final NotificationsRepositories notificationsRepositories;

  UnReadCountNotificationsUseCase(this.notificationsRepositories);

  @override
  Future<Either<Failure, UnReadCountNotificationResponse>> call(NoParams params)async {
    return await notificationsRepositories.getUnReadCountNotifications();
  }
}
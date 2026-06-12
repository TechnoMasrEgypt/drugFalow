import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Home_sction/notifications/domain/entities/mark_as_read_response.dart';
import 'package:drug_flow/features/Home_sction/notifications/domain/repositories/notifications_repositories.dart';

class MarkAllAsReadUseCase extends UseCase<MarkAsReadResponse,NoParams>{
  final NotificationsRepositories notificationsRepositories;


  MarkAllAsReadUseCase(this.notificationsRepositories);

  @override
  Future<Either<Failure, MarkAsReadResponse>> call(NoParams params)async {
    return await notificationsRepositories.markAllAsRead();
  }
}
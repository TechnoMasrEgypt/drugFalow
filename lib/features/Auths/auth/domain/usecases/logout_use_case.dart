import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/logout/logout.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/login/login.dart';
import '../repositories/auth_repositories.dart';

class LogOutUseCase extends UseCase<LogOutResponse,NoParams>{
  final AuthRepositories authRepositories;


  LogOutUseCase(this.authRepositories);

  @override
  Future<Either<Failure, LogOutResponse>> call(NoParams params)async {
    return authRepositories.logout();
  }
}
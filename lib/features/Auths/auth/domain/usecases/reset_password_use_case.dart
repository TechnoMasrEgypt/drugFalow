import 'package:drug_flow/features/Auths/auth/domain/entities/reset_password/reset_password_response.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecases/usecase.dart';
import '../entities/reset_password/reset_password_params.dart';
import '../repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';
class ResetPasswordUseCase extends UseCase<ResetPasswordResponse,ResetPasswordParams>{
  final AuthRepositories authRepositories;


  ResetPasswordUseCase(this.authRepositories);

  @override
  Future<Either<Failure, ResetPasswordResponse>> call(ResetPasswordParams params)async {
    return authRepositories.setNewPass(params: params);
  }
}
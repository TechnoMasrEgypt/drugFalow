import 'package:drug_flow/features/Auths/auth/domain/entities/verify_reset_code/verify_reset_code_params.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/verify_reset_code/verify_reset_code_response.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/auth_repositories.dart';

class VerifyResetCodeUseCase extends UseCase<VerifyResetCodeResponse,VerifyResetParams>{
  final AuthRepositories authRepositories;


  VerifyResetCodeUseCase(this.authRepositories);

  @override
  Future<Either<Failure, VerifyResetCodeResponse>> call(VerifyResetParams params)async {
    return authRepositories.verifyReset(params: params);
  }
}
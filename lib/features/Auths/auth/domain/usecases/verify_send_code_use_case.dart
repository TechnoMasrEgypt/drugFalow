import 'package:drug_flow/features/Auths/auth/domain/entities/verify_send_code/verify_send_code.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/verify_send_code/verify_send_code_params.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/auth_repositories.dart';

class VerifySendCodeUseCase extends UseCase<VerifySendCode,VerifySendCodeParams>{
  final AuthRepositories authRepositories;


  VerifySendCodeUseCase(this.authRepositories);

  @override
  Future<Either<Failure, VerifySendCode>> call(VerifySendCodeParams params)async {
    return authRepositories.verifySendCode(params: params);
  }
}
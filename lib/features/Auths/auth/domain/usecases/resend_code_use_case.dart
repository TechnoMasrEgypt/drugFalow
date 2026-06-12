import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/resend_code/resend_code.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/resend_code/resend_code_params.dart';
import 'package:drug_flow/features/Auths/auth/domain/repositories/auth_repositories.dart';

class ResendCodeUseCase extends UseCase<ResendCodeResponse,ResendCodeParams>{
  final AuthRepositories authRepositories;


  ResendCodeUseCase(this.authRepositories);

  @override
  Future<Either<Failure, ResendCodeResponse>> call(ResendCodeParams params) async{
    return await authRepositories.resendCode(params: params);
  }
}
import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/forgot_password/forgot_password.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/forgot_password/forgot_password_params.dart';
import 'package:drug_flow/features/Auths/auth/domain/repositories/auth_repositories.dart';

class ForgotPasswordUseCase extends UseCase<ForgotPasswordResponse,ForgetPasswordParams>{
   final AuthRepositories authRepositories;


   ForgotPasswordUseCase(this.authRepositories);

   @override
  Future<Either<Failure, ForgotPasswordResponse>> call(ForgetPasswordParams params)async {
    return await authRepositories.forgotPass(params: params);
  }

}
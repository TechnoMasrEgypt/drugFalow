import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/login/login.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/login/login_params.dart';
import 'package:drug_flow/features/Auths/auth/domain/repositories/auth_repositories.dart';

class LoginUseCase extends UseCase<LoginResponse,LoginParams>{
  final AuthRepositories authRepositories;


  LoginUseCase(this.authRepositories);

  @override
  Future<Either<Failure, LoginResponse>> call(LoginParams params)async {
    return authRepositories.signIn(params: params);
  }
}
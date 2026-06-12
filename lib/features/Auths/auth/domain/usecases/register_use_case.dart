import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/login/login.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/login/login_params.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/register/register.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/register/register_params.dart';
import 'package:drug_flow/features/Auths/auth/domain/repositories/auth_repositories.dart';

class RegisterUseCase extends UseCase<RegisterResponse,RegisterParams>{
  final AuthRepositories authRepositories;


  RegisterUseCase(this.authRepositories);

  @override
  Future<Either<Failure, RegisterResponse>> call(RegisterParams params)async {
    return authRepositories.createCustomer(params: params);
  }
}
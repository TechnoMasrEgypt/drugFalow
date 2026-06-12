import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/verify_account/verify_account.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/verify_account/verify_account_params.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/verify_send_code/verify_send_code.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/verify_send_code/verify_send_code_params.dart';
import 'package:drug_flow/features/Auths/auth/domain/repositories/auth_repositories.dart';

class VerifyAccountUseCase extends UseCase<VerifyAccountResponse,VerifyAccountParams>{
  final AuthRepositories authRepositories;


  VerifyAccountUseCase(this.authRepositories);

  @override
  Future<Either<Failure, VerifyAccountResponse>> call(VerifyAccountParams params)async {
    return await authRepositories.verifyAccount(params: params);
  }


}
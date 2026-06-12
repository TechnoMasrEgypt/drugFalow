import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/delete_account/delete_account_response.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../repositories/auth_repositories.dart';

class DeleteAccountUseCase extends UseCase<DeleteAccountResponse,NoParams>{
  final AuthRepositories authRepositories;


  DeleteAccountUseCase(this.authRepositories);

  @override
  Future<Either<Failure, DeleteAccountResponse>> call(NoParams params)async {
    return authRepositories.deleteAccount();
  }
}
part of 'delete_account_cubit.dart';

@immutable
sealed class DeleteAccountState {}

final class DeleteAccountInitial extends DeleteAccountState {}


class DeleteAccountLoading extends DeleteAccountState {}



class DeleteAccountError extends DeleteAccountState{
  final String message;

  DeleteAccountError({required this.message});
}



class DeleteAccountSuccess extends DeleteAccountState{
  final DeleteAccountResponse deleteAccountResponse;

  DeleteAccountSuccess({required this.deleteAccountResponse});
}


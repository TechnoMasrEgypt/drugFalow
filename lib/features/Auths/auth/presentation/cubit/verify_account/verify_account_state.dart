part of 'verify_account_cubit.dart';

@immutable
sealed class VerifyAccountState {}

final class VerifyAccountInitial extends VerifyAccountState {}


class VerifyAccountLoading extends VerifyAccountState {}



class VerifyAccountError extends VerifyAccountState {
  final String message;

  VerifyAccountError({required this.message});
}



class VerifyAccountSuccess extends VerifyAccountState {
  final VerifyAccountResponse verifyAccountResponse;

  VerifyAccountSuccess({required this.verifyAccountResponse});
}




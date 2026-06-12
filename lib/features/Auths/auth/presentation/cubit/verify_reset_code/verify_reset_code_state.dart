part of 'verify_reset_code_cubit.dart';

@immutable
sealed class VerifyResetCodeState {}

final class VerifyResetCodeInitial extends VerifyResetCodeState {}


class VerifyResetCodeLoading extends VerifyResetCodeState  {}



class VerifyResetCodeError extends VerifyResetCodeState {
  final String message;

  VerifyResetCodeError({required this.message});
}



class VerifyResetCodeSuccess extends VerifyResetCodeState  {
  final VerifyResetCodeResponse verifyResetCodeResponse;

  VerifyResetCodeSuccess({required this.verifyResetCodeResponse});
}


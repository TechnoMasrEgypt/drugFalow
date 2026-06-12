part of 'verify_send_code_cubit.dart';

@immutable
sealed class VerifySendCodeState {}

final class VerifySendCodeInitial extends VerifySendCodeState {}



class VerifySendCodeLoading extends VerifySendCodeState {}



class VerifySendCodeError extends VerifySendCodeState  {
  final String message;

  VerifySendCodeError({required this.message});
}



class VerifySendCodeSuccess extends VerifySendCodeState  {
  final VerifySendCode verifySendCode;

  VerifySendCodeSuccess({required this.verifySendCode});
}




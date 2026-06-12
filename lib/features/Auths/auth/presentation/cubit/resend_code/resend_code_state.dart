part of 'resend_code_cubit.dart';

@immutable
sealed class ResendCodeState {}

final class ResendCodeInitial extends ResendCodeState {}



class ResendCodeLoading extends ResendCodeState {}



class ResendCodeError extends ResendCodeState {
  final String message;

  ResendCodeError({required this.message});
}



class ResendCodeSuccess extends ResendCodeState {
  final ResendCodeResponse resendCodeResponse;

  ResendCodeSuccess({required this.resendCodeResponse});
}


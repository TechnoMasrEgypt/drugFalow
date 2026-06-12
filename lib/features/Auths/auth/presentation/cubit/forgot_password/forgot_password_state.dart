part of 'forgot_password_cubit.dart';

@immutable
sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}


class ForgotPasswordLoading extends ForgotPasswordState {}


class ForgotPasswordError extends ForgotPasswordState {
  final String message;

  ForgotPasswordError({required this.message});
}


class ForgotPasswordSuccess extends ForgotPasswordState {
  final ForgotPasswordResponse forgotPasswordResponse;

  ForgotPasswordSuccess({required this.forgotPasswordResponse});
}

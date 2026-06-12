part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}


class ResetPasswordLoading extends ResetPasswordState {}



class ResetPasswordError extends ResetPasswordState {
  final String message;

  ResetPasswordError({required this.message});
}



class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPasswordResponse resetPasswordResponse;

  ResetPasswordSuccess({required this.resetPasswordResponse});
}


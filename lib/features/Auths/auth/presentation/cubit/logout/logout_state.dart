part of 'logout_cubit.dart';

@immutable
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}


class LogoutLoading extends  LogoutState {}



class LogoutError extends  LogoutState  {
  final String message;

  LogoutError({required this.message});
}



class LogoutSuccess extends LogoutState {
  final LogOutResponse logOutResponse;

  LogoutSuccess({required this.logOutResponse});
}


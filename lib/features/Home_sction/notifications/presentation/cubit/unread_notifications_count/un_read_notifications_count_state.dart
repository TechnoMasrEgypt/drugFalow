part of 'un_read_notifications_count_cubit.dart';

@immutable
sealed class UnReadNotificationsCountState {}

final class UnReadNotificationsCountInitial extends UnReadNotificationsCountState {}



class UnReadNotificationsLoading extends UnReadNotificationsCountState {}



class UnReadNotificationsError extends UnReadNotificationsCountState  {
  final String message;

  UnReadNotificationsError({required this.message});
}



class UnReadNotificationsSuccess extends UnReadNotificationsCountState {}

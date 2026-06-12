part of 'mark_all_read_cubit.dart';

@immutable
sealed class MarkAllReadState {}

final class MarkAllReadInitial extends MarkAllReadState {}


class MarkAllAsReadLoading extends MarkAllReadState {}



class MarkAllAsReadError extends MarkAllReadState {}



class MarkAllAsReadSuccess extends MarkAllReadState {}

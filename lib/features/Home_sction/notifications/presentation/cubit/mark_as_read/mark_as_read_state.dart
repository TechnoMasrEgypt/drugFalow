part of 'mark_as_read_cubit.dart';

@immutable
sealed class MarkAsReadState {}

final class MarkAsReadInitial extends MarkAsReadState {}


class MarkAsReadLoading extends MarkAsReadState {}



class MarkAsReadError extends MarkAsReadState {}



class MarkAsReadSuccess extends MarkAsReadState {}

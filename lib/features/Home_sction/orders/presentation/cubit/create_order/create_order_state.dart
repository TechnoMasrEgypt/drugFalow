part of 'create_order_cubit.dart';

@immutable
sealed class CreateOrderState {}

final class CreateOrderInitial extends CreateOrderState {}


class CreateOrderLoading extends CreateOrderState {}


class CreateOrderError extends CreateOrderState {}



class CreateOrderSuccess extends CreateOrderState {}

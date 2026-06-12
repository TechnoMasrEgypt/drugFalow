part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}


class OrdersLoading extends OrdersState {}



class OrdersError extends OrdersState {}




class OrdersSuccess extends OrdersState {}

part of 'order_details_cubit.dart';

@immutable
sealed class OrderDetailsState {}

final class OrderDetailsInitial extends OrderDetailsState {}


class OrderDetailsLoading extends OrderDetailsState {}


class OrderDetailsError extends OrderDetailsState {}

class OrderDetailsSuccess extends OrderDetailsState {}

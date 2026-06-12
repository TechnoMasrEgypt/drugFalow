part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}


class ProductDetailsError extends ProductDetailsState {}


class ProductDetailsSuccess extends ProductDetailsState {}



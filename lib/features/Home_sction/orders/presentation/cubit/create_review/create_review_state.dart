part of 'create_review_cubit.dart';

@immutable
sealed class CreateReviewState {}

final class CreateReviewInitial extends CreateReviewState {}


class CreateReviewLoading extends CreateReviewState {}



class CreateReviewError extends CreateReviewState {}



class CreateReviewSuccess extends CreateReviewState {}
import 'package:drug_flow/features/Home_sction/profile/data/faqs_response.dart';

abstract class FaqsState {}

class FaqsInitial extends FaqsState {}

class FaqsLoading extends FaqsState {}

class FaqsSuccess extends FaqsState {
  final List<FaqModel> faqs;

  FaqsSuccess(this.faqs);
}

class FaqsError extends FaqsState {
  final String message;

  FaqsError(this.message);
}
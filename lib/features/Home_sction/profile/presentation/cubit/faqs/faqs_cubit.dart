import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/features/Home_sction/profile/data/faqs_response.dart';
import 'package:drug_flow/features/Home_sction/profile/data/logic/profile_repo.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/faqs/faqs_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqsCubit extends Cubit<FaqsState> {
  final ProfileRepo repo;

  FaqsCubit(this.repo) : super(FaqsInitial());

// List<FaqModel> faqs = [];
  Future<void> getFaqs() async {
    emit(FaqsLoading());

    final result = await repo.getFaqs();

    result.when(
      success: (data) {
        emit(FaqsSuccess(data));
      },
      failure: (error) {
        emit(
          FaqsError(
            error.apiErrorModel.message ?? 'حدث خطأ',
          ),
        );
      },
    );
  }
}
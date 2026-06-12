import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_review/create_review_params.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/usecases/create_review_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/errors/failure.dart';

part 'create_review_state.dart';

class CreateReviewCubit extends Cubit<CreateReviewState> {
  CreateReviewCubit(this.createReviewUseCase) : super(CreateReviewInitial());
  final CreateReviewUseCase createReviewUseCase;

  bool? loading = false;
  bool? error = false;
  bool? success = false;
  String? failMsg;

  Future<void>createReview({CreateReviewParams? params})async{
    try {
      loading = true;
      error = false;
      success = false;
      emit(CreateReviewLoading());

      final failOrUser = await createReviewUseCase(params!);
      failOrUser.fold(
            (fail) {
          if(fail is ServerFailure){
            loading = false;
            error= true;
            success = false;
            failMsg = fail.message;
            emit(CreateReviewError());
          }

        },
            (response) {
          loading = false;
          error = false;
          success = true;


          emit(CreateReviewSuccess());
        },
      );
    } catch (e) {
      loading = false;
      error = true;
      success = false;
      failMsg = e.toString();
      // emit(FavouritesError());
    }
  }
}

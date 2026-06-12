import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/order_details/order_details_params.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/usecases/order_details_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/errors/failure.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this.orderDetailsUseCase) : super(OrderDetailsInitial());
  final OrderDetailsUseCase orderDetailsUseCase;
  bool? loading = false;
  bool? error = false;
  bool? success = false;
  String? failMsg;


  Future<void>getOrderDetails({OrderDetailsParams? params})async{
    try {
      loading = true;
      error = false;
      success = false;
      emit(OrderDetailsLoading());

      final failOrUser = await orderDetailsUseCase(params!);
      failOrUser.fold(
            (fail) {
          if(fail is ServerFailure){
            loading = false;
            error = true;
            success = false;
            failMsg = fail.message;
            emit(OrderDetailsError());
          }

        },
            (response) {
          loading = false;
          error = false;
          success = true;

          emit(OrderDetailsSuccess());
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

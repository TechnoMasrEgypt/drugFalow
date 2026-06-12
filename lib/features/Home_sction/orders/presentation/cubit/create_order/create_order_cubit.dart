import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_order/create_order_params.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/usecases/create_order_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/errors/failure.dart';

part 'create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  CreateOrderCubit(this.createOrderUseCase) : super(CreateOrderInitial());
  final CreateOrderUseCase createOrderUseCase;
  bool? loading = false;
  bool? error = false;
  bool? success = false;
  String? failMsg;

  Future<void>createOrder({CreateOrderParams? params})async{
    try {
      loading = true;
     error = false;
      success = false;
      emit(CreateOrderLoading());

      final failOrUser = await createOrderUseCase(params!);
      failOrUser.fold(
            (fail) {
          if(fail is ServerFailure){
            loading = false;
            error= true;
            success = false;
            failMsg = fail.message;
            emit(CreateOrderError());
          }

        },
            (response) {
          loading = false;
          error = false;
          success = true;


          emit(CreateOrderSuccess());
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

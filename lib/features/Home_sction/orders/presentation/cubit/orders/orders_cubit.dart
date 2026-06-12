import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/my_orders/my_orders_params.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/usecases/orders_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/errors/failure.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.ordersUseCase) : super(OrdersInitial());
  final OrdersUseCase ordersUseCase;
  bool? loading = false;
  bool? error = false;
  bool? success = false;
  String? failMsg;


  Future<void>getOrders({MyOrdersParams? params})async{
    try {
      loading = true;
      error = false;
      success = false;
      emit(OrdersLoading());

      final failOrUser = await ordersUseCase(params!);
      failOrUser.fold(
            (fail) {
          if(fail is ServerFailure){
            loading = false;
            error = true;
            success = false;
            failMsg = fail.message;
            emit(OrdersError());
          }

        },
            (response) {
          loading = false;
          error = false;
          success = true;

          emit(OrdersSuccess());
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

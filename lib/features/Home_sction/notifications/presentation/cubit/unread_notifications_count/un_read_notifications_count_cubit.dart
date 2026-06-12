import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/usecases/usecase.dart';
import '../../../domain/usecases/un_read_count_notifications_use_case.dart';

part 'un_read_notifications_count_state.dart';

class UnReadNotificationsCountCubit extends Cubit<UnReadNotificationsCountState> {
  UnReadNotificationsCountCubit(this.unReadNotificationsUseCase) : super(UnReadNotificationsCountInitial());

  bool? unReadLoading = false;
  bool? unReadError = false;
  bool? unReadSuccess = false;
  final UnReadCountNotificationsUseCase unReadNotificationsUseCase;
  String? failMsg;


  Future<void>getUnReadCountNotifications()async{
    try{
      unReadLoading = true;
      unReadError = false;
      unReadSuccess = false;
      emit(UnReadNotificationsLoading());
      final failOrUser = await unReadNotificationsUseCase(NoParams());
      failOrUser.fold((fail){
        if(fail is ServerFailure){
          /*   msgKey.currentState!.showSnackBar
            (SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(fail.message,
                style: TextStyles.textStyleNormal12
                    .copyWith(color: white),textScaler: TextScaler.linear(1),)));*/
          unReadLoading = false;
          unReadError =true;
          unReadSuccess= false;
          failMsg = fail.message;
          emit(UnReadNotificationsError(message: fail.message));
        }
      }, (response)async{
        unReadLoading = false;
        unReadError = false;
        unReadSuccess = true;
       // unReadCountNotificationResponse = response;



        /*   msgKey.currentState!.showSnackBar
          (SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(response.message!,
              style: TextStyles.textStyleNormal12
                  .copyWith(color: white),textScaler: TextScaler.linear(1),)));*/
        emit(UnReadNotificationsSuccess());
      });
    }catch(e){
      unReadLoading = false;
      unReadError =true;
      unReadSuccess= false;

      /*  msgKey.currentState!.showSnackBar
        (SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(e.toString(),
            style: TextStyles.textStyleNormal12
                .copyWith(color: white),textScaler: TextScaler.linear(1),)));*/
    }
  }
}

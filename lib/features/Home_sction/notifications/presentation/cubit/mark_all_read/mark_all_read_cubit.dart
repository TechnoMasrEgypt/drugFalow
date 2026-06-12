import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/styles.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/usecases/usecase.dart';
import '../../../../../../main.dart';
import '../../../domain/usecases/mark_all_as_read_use_case.dart';

part 'mark_all_read_state.dart';

class MarkAllReadCubit extends Cubit<MarkAllReadState> {
  MarkAllReadCubit(this.markAllAsReadUseCase) : super(MarkAllReadInitial());

  bool? allReadLoading = false;
  bool? allReadError = false;
  bool? allReadSuccess = false;
  String? failMsg;

  final MarkAllAsReadUseCase markAllAsReadUseCase;


  Future<void>markAllAsRead()async{
    try{
      allReadLoading = true;
      allReadError = false;
      allReadSuccess = false;
      emit(MarkAllAsReadLoading());
      final failOrUser = await markAllAsReadUseCase(NoParams());
      failOrUser.fold((fail){
        if(fail is ServerFailure){
          msgKey.currentState!.showSnackBar
            (SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(fail.message,
                style: TextStyles.textStyleNormal12
                    .copyWith(color: white),textScaler: TextScaler.linear(1),)));
          allReadLoading = false;
          allReadError = true;
          allReadSuccess = false;
          failMsg = fail.message;
          emit(MarkAllAsReadError());
        }
      }, (response)async{
        allReadLoading = false;
        allReadError = false;
        allReadSuccess = true;
     /*   getNotifications(params: NotificationParams(page: 1));
        getUnReadCountNotifications();*/

        msgKey.currentState!.showSnackBar
          (SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(response.message!,
              style: TextStyles.textStyleNormal12
                  .copyWith(color: white),textScaler: TextScaler.linear(1),)));
        emit(MarkAllAsReadSuccess());
      });
    }catch(e){
      allReadLoading = false;
      allReadError = true;
      allReadSuccess = false;

      msgKey.currentState!.showSnackBar
        (SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(e.toString(),
            style: TextStyles.textStyleNormal12
                .copyWith(color: white),textScaler: TextScaler.linear(1),)));
    }

  }

}

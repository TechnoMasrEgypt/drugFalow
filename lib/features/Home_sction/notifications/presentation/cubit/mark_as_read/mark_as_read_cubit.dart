import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/styles.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../main.dart';
import '../../../domain/entities/notification_params.dart';
import '../../../domain/usecases/mark_as_read_use_case.dart';

part 'mark_as_read_state.dart';

class MarkAsReadCubit extends Cubit<MarkAsReadState> {
  MarkAsReadCubit(this.markAsReadUseCase) : super(MarkAsReadInitial());

  bool? readLoading = false;
  bool? readError = false;
  bool? readSuccess = false;

  final MarkAsReadUseCase markAsReadUseCase;
  String? failMsg;


  Future<void>markAsRead({NotificationParams? params})async{
    try{
      readLoading = true;
      readError = false;
      readSuccess = false;
      emit(MarkAsReadLoading());
      final failOrUser = await markAsReadUseCase(params!);
      failOrUser.fold((fail){
        if(fail is ServerFailure){
          msgKey.currentState!.showSnackBar
            (SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(fail.message,
                style: TextStyles.textStyleNormal12
                    .copyWith(color: white),textScaler: TextScaler.linear(1),)));
          readLoading =false;
          readError = true;
          readSuccess = false;
          failMsg = fail.message;
          emit(MarkAsReadError());
        }
      }, (response)async{
        readLoading =false;
        readError = false;
        readSuccess = true;
     /*   getUnReadCountNotifications();
        getNotifications(params: NotificationParams(page: 1));*/


        msgKey.currentState!.showSnackBar
          (SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(response.message!,
              style: TextStyles.textStyleNormal12
                  .copyWith(color: white),textScaler: TextScaler.linear(1),)));
        emit(MarkAsReadSuccess());
      });
    }catch(e){
      readLoading =false;
      readError = true;
      readSuccess = false;

      msgKey.currentState!.showSnackBar
        (SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(e.toString(),
            style: TextStyles.textStyleNormal12
                .copyWith(color: white),textScaler: TextScaler.linear(1),)));
    }

  }
}

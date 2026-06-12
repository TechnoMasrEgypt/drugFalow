import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/reset_password/reset_password_params.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/reset_password/reset_password_response.dart';
import 'package:drug_flow/features/Auths/auth/domain/usecases/reset_password_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/styles.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../main.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.resetPasswordUseCase) : super(ResetPasswordInitial());

  final ResetPasswordUseCase resetPasswordUseCase;

  bool? loading = false;
  bool? error = false;
  bool success = false;


  Future<void>resetPass({ResetPasswordParams? params})async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(ResetPasswordLoading());
      final failOrUser = await resetPasswordUseCase(params!);
      failOrUser.fold((fail){
        if(fail is ServerFailure){
          msgKey.currentState!.showSnackBar
            (SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(fail.message,
                style: TextStyles.textStyleNormal12
                    .copyWith(color: white),textScaler: TextScaler.linear(1),)));
          loading = false;
          error = true;
          success = false;
          emit(ResetPasswordError(message: fail.message));
        }
      }, (response)async{
        loading = false;
        error = false;
        success = true;
        if(response.success == true){

        }else {
          msgKey.currentState!.showSnackBar
            (SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(response.message!,
                style: TextStyles.textStyleNormal12
                    .copyWith(color: white),textScaler: TextScaler.linear(1),)));
        }


        emit(ResetPasswordSuccess(resetPasswordResponse: response));
      });
    }catch(e){
      loading = false;
      error = true;
      success = false;

      msgKey.currentState!.showSnackBar
        (SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(e.toString(),
            style: TextStyles.textStyleNormal12
                .copyWith(color: white),textScaler: TextScaler.linear(1),)));
      //  emit(RegisterError(message: e.toString()));
    }
  }
}

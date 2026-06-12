import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/forgot_password/forgot_password.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/forgot_password/forgot_password_params.dart';
import 'package:drug_flow/features/Auths/auth/domain/usecases/forgot_password_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/styles.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../main.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.forgotPasswordUseCase) : super(ForgotPasswordInitial());
  final ForgotPasswordUseCase forgotPasswordUseCase;

  bool? loading = false;
  bool? error = false;
  bool success = false;


  Future<void>forgotPass({ForgetPasswordParams? params,})async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(ForgotPasswordLoading());
      final failOrUser = await forgotPasswordUseCase(params!);
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
          emit(ForgotPasswordError(message: fail.message));
        }
      }, (response)async{
        loading = false;
        error = false;
        success = true;

        emit(ForgotPasswordSuccess(forgotPasswordResponse: response));
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
      emit(ForgotPasswordError(message: e.toString()));
    }
  }

}

import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/resend_code/resend_code.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/resend_code/resend_code_params.dart';
import 'package:drug_flow/features/Auths/auth/domain/usecases/resend_code_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/styles.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../main.dart';

part 'resend_code_state.dart';

class ResendCodeCubit extends Cubit<ResendCodeState> {
  ResendCodeCubit(this.resendCodeUseCase) : super(ResendCodeInitial());
  final ResendCodeUseCase resendCodeUseCase;

  bool? loading = false;
  bool? error = false;
  bool success = false;


  Future<void>resendCode({ResendCodeParams? params})async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(ResendCodeLoading());
      final failOrUser = await resendCodeUseCase(params!);
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
          emit(ResendCodeError(message: fail.message));
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


        emit(ResendCodeSuccess(resendCodeResponse: response));
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

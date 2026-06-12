import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/verify_send_code/verify_send_code.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/verify_send_code/verify_send_code_params.dart';
import 'package:drug_flow/features/Auths/auth/domain/usecases/verify_send_code_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/styles.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../main.dart';

part 'verify_send_code_state.dart';

class VerifySendCodeCubit extends Cubit<VerifySendCodeState> {
  VerifySendCodeCubit(this.verifySendCodeUseCase) : super(VerifySendCodeInitial());
  final VerifySendCodeUseCase verifySendCodeUseCase;


  bool? loading = false;
  bool? error = false;
  bool success = false;


  Future<void>verifySendCode({VerifySendCodeParams? params,})async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(VerifySendCodeLoading());
      final failOrUser = await verifySendCodeUseCase(params!);
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
          emit(VerifySendCodeError(message: fail.message));
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


        emit(VerifySendCodeSuccess(verifySendCode: response));
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
      emit(VerifySendCodeError(message: e.toString()));
    }
  }
}

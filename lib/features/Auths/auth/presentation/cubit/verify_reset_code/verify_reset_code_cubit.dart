import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/verify_reset_code/verify_reset_code_params.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/verify_reset_code/verify_reset_code_response.dart';
import 'package:drug_flow/features/Auths/auth/domain/usecases/verify_reset_code_use_case.dart';
import 'package:meta/meta.dart';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/styles.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../main.dart';

part 'verify_reset_code_state.dart';

class VerifyResetCodeCubit extends Cubit<VerifyResetCodeState> {
  VerifyResetCodeCubit(this.verifyResetCodeUseCase) : super(VerifyResetCodeInitial());

  final VerifyResetCodeUseCase verifyResetCodeUseCase;
  bool? loading = false;
  bool? error = false;
  bool success = false;


  Future<void>verifyReset({VerifyResetParams? params})async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(VerifyResetCodeLoading());
      final failOrUser = await verifyResetCodeUseCase(params!);
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
          emit(VerifyResetCodeError(message: fail.message));
        }
      }, (response)async{
        loading = false;
        error = false;
        success = true;

        emit(VerifyResetCodeSuccess(verifyResetCodeResponse: response));
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
    }
  }




}

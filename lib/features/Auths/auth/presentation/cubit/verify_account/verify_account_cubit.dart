import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/verify_account/verify_account.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/verify_account/verify_account_params.dart';
import 'package:drug_flow/features/Auths/auth/domain/usecases/verify_account_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/styles.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../main.dart';

part 'verify_account_state.dart';

class VerifyAccountCubit extends Cubit<VerifyAccountState> {
  VerifyAccountCubit(this.verifyAccountUseCase) : super(VerifyAccountInitial());
  final VerifyAccountUseCase verifyAccountUseCase;

  bool? loading = false;
  bool? error = false;
  bool success = false;


  Future<void>verifyAccount({VerifyAccountParams? params})async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(VerifyAccountLoading());
      final failOrUser = await verifyAccountUseCase(params!);
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
          emit(VerifyAccountError(message: fail.message));
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


        emit(VerifyAccountSuccess(verifyAccountResponse: response));
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

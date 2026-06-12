import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/delete_account/delete_account_response.dart';
import 'package:drug_flow/features/Auths/auth/domain/usecases/delete_account_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/styles.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/usecases/usecase.dart';
import '../../../../../../main.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit(this.deleteAccountUseCase) : super(DeleteAccountInitial());

  final DeleteAccountUseCase deleteAccountUseCase;

  bool? loading = false;
  bool? error = false;
  bool success = false;


  Future<void>deleteAccount()async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(DeleteAccountLoading());
      final failOrUser = await deleteAccountUseCase(NoParams());
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
          emit(DeleteAccountError(message: fail.message));
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


        emit(DeleteAccountSuccess(deleteAccountResponse: response));
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

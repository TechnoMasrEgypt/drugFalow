
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/reset_password/reset_password_params.dart';
import 'package:drug_flow/features/Auths/forgot_password/data/forget_password_repo.dart';
import 'package:drug_flow/features/Auths/forgot_password/logic/forget_password_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ForgetPasswordCubit extends Cubit<ForgetPassState> {
  ForgetPasswordCubit(this._foForgetRepo) : super(const ForgetPassState.initial());

  final ForgetRepo _foForgetRepo;

  final TextEditingController emailEditingController =
      TextEditingController();


  Future<void> forgetPassword(String email) async {
    emit(const ForgetPassState.loading());
    final result = await _foForgetRepo.forgetpassword(email);
    result.when(
      success: (response) => emit(ForgetPassState.ForgetSuccess(response)),
      failure: (error) => emit(
        ForgetPassState.error(message: error.apiErrorModel.message ?? 'خطأ في الإرسال'),
      ),
    );
  }

  Future<void> resetPassword(ResetPasswordParams params) async {
    emit(const ForgetPassState.loading());
    final result = await _foForgetRepo.resetPassword(params);
    result.when(
      success: (response) => emit(ForgetPassState.resetPasswordSuccess(response)),
      failure: (error) => emit(
        ForgetPassState.error(message: error.apiErrorModel.message ?? 'خطأ في الإرسال'),
      ),
    );
  } 
    @override
   Future<void> close() {
    emailEditingController.dispose();
    return super.close();
  }
}
import 'package:drug_flow/features/Auths/auth/domain/entities/reset_password/reset_password_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:drug_flow/features/Auths/forgot_password/data/forget_password_response.dart';
part 'forget_password_state.freezed.dart';

@freezed
class ForgetPassState with _$ForgetPassState {
  const factory ForgetPassState.initial()                         = _Initial;
  const factory ForgetPassState.loading()                         = _Loading;
  const factory ForgetPassState.ForgetSuccess(ForgetResponseModel response) = _ForgetSuccess;
  const factory ForgetPassState.error({required String message})  = _Error;
  const factory ForgetPassState.resetPasswordSuccess(ResetPasswordResponse response) = _ResetPasswordSuccess; 
}

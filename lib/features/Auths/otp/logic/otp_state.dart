import 'package:drug_flow/features/Auths/auth/domain/entities/verify_reset_code/verify_reset_code_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:drug_flow/features/Auths/otp/data/otp_response.dart';

part 'otp_state.freezed.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState.initial()                         = _Initial;
  const factory OtpState.loading()                         = _Loading;
  const factory OtpState.resendSuccess(OtpResponseModel response) = _ResendSuccess;
  const factory OtpState.error({required String message})  = _Error;
  const factory OtpState.verifySuccess(
  VerifyResetCodeResponse response,
) = _VerifySuccess;
}

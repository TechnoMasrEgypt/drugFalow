import 'package:bloc/bloc.dart';
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/features/Auths/otp/data/repo/otp_repo.dart';
import 'package:drug_flow/features/Auths/otp/logic/otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this._otpRepo) : super(const OtpState.initial());

  final OtpRepo _otpRepo;

  Future<void> resendCode(String email) async {
    emit(const OtpState.loading());
    final result = await _otpRepo.resendCode(email);
    result.when(
      success: (response) => emit(OtpState.resendSuccess(response)),
      failure: (error) => emit(
        OtpState.error(message: error.apiErrorModel.message ?? 'خطأ في الإرسال'),
      ),
    );
  }
  Future<void> verifyResetCode({
  required String email,
  required String code,
}) async {
  emit(const OtpState.loading());

  final result = await _otpRepo.verifyResetCode(
    email: email,
    code: code,
  );

  result.when(
    success: (response) {
      emit(
        OtpState.verifySuccess(response),
      );
    },
    failure: (error) {
      emit(
        OtpState.error(
          message:
              error.apiErrorModel.message ??
              'Something went wrong',
        ),
      );
    },
  );
}
}

import 'package:drug_flow/core/networking/api_error_handler.dart';
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/core/networking/api_services.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/verify_reset_code/verify_reset_code_response.dart';
import 'package:drug_flow/features/Auths/otp/data/otp_response.dart';

class OtpRepo {
  final ApiService _apiService;

  OtpRepo(this._apiService);

  Future<ApiResult<OtpResponseModel>> resendCode(String email) async {
    try {
      final response = await _apiService.resendCode({'email': email});
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
  Future<ApiResult<VerifyResetCodeResponse>> verifyResetCode({
  required String email,
  required String code,
}) async {
  try {
    final response = await _apiService.verifyResetCode({
      'email': email,
      'code': code,
    });

    return ApiResult.success(response);
  } catch (e) {
    return ApiResult.failure(
      ErrorHandler.handle(e),
    );
  }
}
}



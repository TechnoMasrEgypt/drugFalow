import 'package:drug_flow/core/networking/api_error_handler.dart';
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/core/networking/api_services.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/reset_password/reset_password_params.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/reset_password/reset_password_response.dart';
import 'package:drug_flow/features/Auths/forgot_password/data/forget_password_response.dart';

class ForgetRepo {
  final ApiService _apiService;

  ForgetRepo(this._apiService);

  Future<ApiResult<ForgetResponseModel>> forgetpassword(String email) async {
    try {
      final response = await _apiService.forgetpassword({'email': email});
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
  Future<ApiResult<ResetPasswordResponse>> resetPassword(
    ResetPasswordParams params,
  ) async {
    try {
      final response = await _apiService.resetPassword(params);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

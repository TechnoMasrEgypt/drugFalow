import 'package:drug_flow/core/networking/api_error_handler.dart';
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/core/networking/api_services.dart';
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
}

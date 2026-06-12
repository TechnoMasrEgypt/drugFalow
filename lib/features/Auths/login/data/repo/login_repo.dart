import 'package:drug_flow/core/networking/api_error_handler.dart';
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/core/networking/api_services.dart';

import '../models/login_request_body.dart';
import '../models/login_response.dart';

class LoginRepository {
  final ApiService _apiService;
  LoginRepository(this._apiService);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await _apiService.login(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}

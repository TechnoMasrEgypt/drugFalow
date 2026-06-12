import 'package:drug_flow/core/networking/api_error_handler.dart';
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/core/networking/api_services.dart';
import 'package:drug_flow/features/Auths/register/data/governorate_model.dart';
  
class GovernorateRepo {
  final ApiService _apiService;

  GovernorateRepo(this._apiService);

  Future<ApiResult<List<GovernorateModel>>> getGovernorates() async {
    try {
      final response = await _apiService.governorates();
      return ApiResult.success(response.data);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
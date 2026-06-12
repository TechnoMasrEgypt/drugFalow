import 'package:dio/dio.dart';
import 'package:drug_flow/core/networking/api_error_handler.dart';
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/core/networking/api_services.dart';
import 'package:drug_flow/features/Auths/register/data/register_request_body.dart';
import 'package:drug_flow/features/Auths/register/data/register_response.dart';

class RegisterRepo {
  final ApiService _apiService;

  RegisterRepo(this._apiService);

  Future<ApiResult<AuthResponseModel>> registration(
    RegisterRequestBody rBody,
  ) async {
    try {
      // Prepend country code to each phone number
      final phone       = '${rBody.countryCode}${rBody.phone}';
      final secondPhone = rBody.secondPhone != null
          ? '${rBody.countryCode2 ?? rBody.countryCode}${rBody.secondPhone}'
          : null;
      final landline = rBody.landline != null
          ? '${rBody.countryCode3 ?? rBody.countryCode}${rBody.landline}'
          : null;

      final formData = FormData.fromMap({
        'name':                  rBody.name,
        'email':                 rBody.email,
        'password':              rBody.password,
        'password_confirmation': rBody.passwordConfirmation,
        'phone':                 phone,
        if (secondPhone != null) 'second_phone': secondPhone,
        if (landline    != null) 'landline':     landline,
        'governorate_id':        rBody.governorateId,
        'city_id':               rBody.cityId,
        'area_id':               rBody.areaId,
        'address':               rBody.address,
        'terms_accepted':        rBody.termsAccepted ? 1 : 0,
        if (rBody.image != null)
          'image': await MultipartFile.fromFile(
            rBody.image!.path,
            filename: rBody.image!.path.split('/').last,
          ),
        if (rBody.licenseFile != null)
          'license_file': await MultipartFile.fromFile(
            rBody.licenseFile!.path,
            filename: rBody.licenseFile!.path.split('/').last,
          ),
      });

      final response = await _apiService.register(formData);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}

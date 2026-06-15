import 'package:dio/dio.dart';
import 'package:drug_flow/core/networking/api_error_handler.dart';
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/core/networking/api_services.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/delete_account/delete_account_response.dart';
import 'package:drug_flow/features/Home_sction/profile/data/contact_request.dart';
import 'package:drug_flow/features/Home_sction/profile/data/contact_response.dart';
import 'package:drug_flow/features/Home_sction/profile/data/coupon_response.dart';
import 'package:drug_flow/features/Home_sction/profile/data/faqs_response.dart';
import 'package:drug_flow/features/Home_sction/profile/data/get_profile/profile_response.dart';
import 'package:drug_flow/features/Home_sction/profile/data/logout_response.dart';
import 'package:drug_flow/features/Home_sction/profile/data/models/update_profile_request_body.dart';
import 'package:drug_flow/features/Home_sction/profile/data/social_links_response.dart';
import 'package:flutter/material.dart';

class ProfileRepo {
  final ApiService _apiService;
  ProfileRepo(this._apiService);

  Future<ApiResult<ProfileData>> getProfile() async {
    try {
      final response = await _apiService.getProfile();

      final model = response;

      return ApiResult.success(model.data!);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<DeleteAccountResponse>> deleteAccount() async {
    try {
      final response = await _apiService.deleteAccount();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<ProfileData>> updateProfile(
    UpdateProfileRequestBody body,
  ) async {
    try {
      final response = await _apiService.updateProfile(body);

      return ApiResult.success(response.data! );
    } catch (e, s) {
      debugPrint('UPDATE PROFILE ERROR => $e');
      debugPrintStack(stackTrace: s);
      if (e is DioException) {
        print('STATUS => ${e.response?.statusCode}');
        print('DATA => ${e.response?.data}');
        print('HEADERS => ${e.requestOptions.headers}');
        print('PATH => ${e.requestOptions.path}');
      }
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<CouponModel>>> getCoupons() async {
    try {
      final response = await _apiService.coupons();

      return ApiResult.success(response.data);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<FaqModel>>> getFaqs() async {
    try {
      final response = await _apiService.getFaqs();

      return ApiResult.success(response.data);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<SocialLinksResponse>> getSocialLinks() async {
    try {
      final response = await _apiService.getSocialLinks();

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
  Future<ApiResult<ContactResponse>> contactUs(ContactRequest body) async {
    try {
      final response = await _apiService.contactUs(body);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<LogoutResponse>> logout() async {
  try {
    final response = await _apiService.logout();

    return ApiResult.success(response);
  } catch (e) {
    return ApiResult.failure(ErrorHandler.handle(e));
  }
}
}

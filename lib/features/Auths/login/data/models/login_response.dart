import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool? success;
  final String? message;
  final LoginData? data;

  LoginResponse({
    this.success,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginData {
  final String? token;
  final UserModel? user;

  LoginData({
    this.token,
    this.user,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LoginDataToJson(this);
}

@JsonSerializable()
class UserModel {
  final int? id;
  final TranslationModel? name;
  final String? email;

  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;

  @JsonKey(name: 'reset_password_token')
  final String? resetPasswordToken;

  @JsonKey(name: 'reset_password_token_expires_at')
  final String? resetPasswordTokenExpiresAt;

  @JsonKey(name: 'verification_code')
  final String? verificationCode;

  @JsonKey(name: 'verification_code_expires_at')
  final String? verificationCodeExpiresAt;

  final String? phone;

  @JsonKey(name: 'second_phone')
  final String? secondPhone;

  final String? landline;
  final String? image;

  @JsonKey(name: 'license_file')
  final String? licenseFile;

  @JsonKey(name: 'fcm_token')
  final String? fcmToken;

  @JsonKey(name: 'is_verified')
  final bool? isVerified;

  @JsonKey(name: 'is_active')
  final bool? isActive;

  @JsonKey(name: 'all_warehouses')
  final int? allWarehouses;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'pharmacy_code')
  final String? pharmacyCode;

  @JsonKey(name: 'city_id')
  final int? cityId;

  @JsonKey(name: 'area_id')
  final int? areaId;

  final TranslationModel? address;

  @JsonKey(name: 'governorate_id')
  final int? governorateId;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.resetPasswordToken,
    this.resetPasswordTokenExpiresAt,
    this.verificationCode,
    this.verificationCodeExpiresAt,
    this.phone,
    this.secondPhone,
    this.landline,
    this.image,
    this.licenseFile,
    this.fcmToken,
    this.isVerified,
    this.isActive,
    this.allWarehouses,
    this.createdAt,
    this.updatedAt,
    this.pharmacyCode,
    this.cityId,
    this.areaId,
    this.address,
    this.governorateId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UserModelToJson(this);
}

@JsonSerializable()
class TranslationModel {
  final String? en;
  final String? ar;

  TranslationModel({
    this.en,
    this.ar,
  });

  factory TranslationModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$TranslationModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TranslationModelToJson(this);
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
  token: json['token'] as String?,
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
  'token': instance.token,
  'user': instance.user,
};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] == null
      ? null
      : TranslationModel.fromJson(json['name'] as Map<String, dynamic>),
  email: json['email'] as String?,
  emailVerifiedAt: json['email_verified_at'] as String?,
  resetPasswordToken: json['reset_password_token'] as String?,
  resetPasswordTokenExpiresAt:
      json['reset_password_token_expires_at'] as String?,
  verificationCode: json['verification_code'] as String?,
  verificationCodeExpiresAt: json['verification_code_expires_at'] as String?,
  phone: json['phone'] as String?,
  secondPhone: json['second_phone'] as String?,
  landline: json['landline'] as String?,
  image: json['image'] as String?,
  licenseFile: json['license_file'] as String?,
  fcmToken: json['fcm_token'] as String?,
  isVerified: json['is_verified'] as bool?,
  isActive: json['is_active'] as bool?,
  allWarehouses: (json['all_warehouses'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  pharmacyCode: json['pharmacy_code'] as String?,
  cityId: (json['city_id'] as num?)?.toInt(),
  areaId: (json['area_id'] as num?)?.toInt(),
  address: json['address'] == null
      ? null
      : TranslationModel.fromJson(json['address'] as Map<String, dynamic>),
  governorateId: (json['governorate_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'email_verified_at': instance.emailVerifiedAt,
  'reset_password_token': instance.resetPasswordToken,
  'reset_password_token_expires_at': instance.resetPasswordTokenExpiresAt,
  'verification_code': instance.verificationCode,
  'verification_code_expires_at': instance.verificationCodeExpiresAt,
  'phone': instance.phone,
  'second_phone': instance.secondPhone,
  'landline': instance.landline,
  'image': instance.image,
  'license_file': instance.licenseFile,
  'fcm_token': instance.fcmToken,
  'is_verified': instance.isVerified,
  'is_active': instance.isActive,
  'all_warehouses': instance.allWarehouses,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'pharmacy_code': instance.pharmacyCode,
  'city_id': instance.cityId,
  'area_id': instance.areaId,
  'address': instance.address,
  'governorate_id': instance.governorateId,
};

TranslationModel _$TranslationModelFromJson(Map<String, dynamic> json) =>
    TranslationModel(en: json['en'] as String?, ar: json['ar'] as String?);

Map<String, dynamic> _$TranslationModelToJson(TranslationModel instance) =>
    <String, dynamic>{'en': instance.en, 'ar': instance.ar};

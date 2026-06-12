// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    AuthResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: OtpDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseModelToJson(AuthResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

AuthDataModel _$AuthDataModelFromJson(Map<String, dynamic> json) =>
    AuthDataModel(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthDataModelToJson(AuthDataModel instance) =>
    <String, dynamic>{'user': instance.user};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num).toInt(),
  image: json['image'] as String,
  name: NameModel.fromJson(json['name'] as Map<String, dynamic>),
  email: json['email'] as String,
  phone: json['phone'] as String,
  secondPhone: json['second_phone'] as String?,
  landline: json['landline'] as String?,
  governorateId: json['governorate_id'] as String,
  cityId: json['city_id'] as String,
  areaId: json['area_id'] as String,
  address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
  licenseFile: json['license_file'] as String,
  isVerified: json['is_verified'] as bool,
  isActive: json['is_active'] as bool,
  pharmacyCode: json['pharmacy_code'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'second_phone': instance.secondPhone,
  'landline': instance.landline,
  'governorate_id': instance.governorateId,
  'city_id': instance.cityId,
  'area_id': instance.areaId,
  'address': instance.address,
  'license_file': instance.licenseFile,
  'image': instance.image,
  'is_verified': instance.isVerified,
  'is_active': instance.isActive,
  'pharmacy_code': instance.pharmacyCode,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

NameModel _$NameModelFromJson(Map<String, dynamic> json) =>
    NameModel(en: json['en'] as String);

Map<String, dynamic> _$NameModelToJson(NameModel instance) => <String, dynamic>{
  'en': instance.en,
};

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) =>
    AddressModel(en: json['en'] as String);

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{'en': instance.en};

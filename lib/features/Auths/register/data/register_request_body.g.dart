// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestBody _$RegisterRequestBodyFromJson(Map<String, dynamic> json) =>
    RegisterRequestBody(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
      phone: json['phone'] as String,
      secondPhone: json['second_phone'] as String?,
      landline: json['landline'] as String?,
      governorateId: (json['governorate_id'] as num).toInt(),
      cityId: (json['city_id'] as num).toInt(),
      areaId: (json['area_id'] as num).toInt(),
      address: json['address'] as String,
    );

Map<String, dynamic> _$RegisterRequestBodyToJson(
  RegisterRequestBody instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'password': instance.password,
  'password_confirmation': instance.passwordConfirmation,
  'phone': instance.phone,
  'second_phone': instance.secondPhone,
  'landline': instance.landline,
  'governorate_id': instance.governorateId,
  'city_id': instance.cityId,
  'area_id': instance.areaId,
  'address': instance.address,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequestBody _$UpdateProfileRequestBodyFromJson(
  Map<String, dynamic> json,
) => UpdateProfileRequestBody(
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  secondPhone: json['second_phone'] as String?,
  landline: json['landline'] as String?,
  address: json['address'] as String?,
  governorateId: json['governorate_id'] as String?,
  cityId: json['city_id'] as String?,
  areaId: json['area_id'] as String?,
);

Map<String, dynamic> _$UpdateProfileRequestBodyToJson(
  UpdateProfileRequestBody instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'second_phone': instance.secondPhone,
  'landline': instance.landline,
  'address': instance.address,
  'governorate_id': instance.governorateId,
  'city_id': instance.cityId,
  'area_id': instance.areaId,
};

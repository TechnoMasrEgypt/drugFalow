// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => ProfileData(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  secondPhone: json['secondPhone'] as String?,
  landline: json['landline'] as String?,
  image: json['image'] as String?,
  pharmacyCode: json['pharmacyCode'] as String?,
  governorateId: (json['governorateId'] as num?)?.toInt(),
  governorate: json['governorate'] as String?,
  cityId: (json['cityId'] as num?)?.toInt(),
  city: json['city'] as String?,
  areaId: (json['areaId'] as num?)?.toInt(),
  area: json['area'] as String?,
  address: json['address'] as String?,
  licenseFile: json['licenseFile'] as String?,
);

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'secondPhone': instance.secondPhone,
      'landline': instance.landline,
      'image': instance.image,
      'pharmacyCode': instance.pharmacyCode,
      'governorateId': instance.governorateId,
      'governorate': instance.governorate,
      'cityId': instance.cityId,
      'city': instance.city,
      'areaId': instance.areaId,
      'area': instance.area,
      'address': instance.address,
      'licenseFile': instance.licenseFile,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpResponseModel _$OtpResponseModelFromJson(Map<String, dynamic> json) =>
    OtpResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: OtpDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtpResponseModelToJson(OtpResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

OtpDataModel _$OtpDataModelFromJson(Map<String, dynamic> json) => OtpDataModel(
  expiresIn: json['expires_in'] as String,
  code: json['code'] as String,
);

Map<String, dynamic> _$OtpDataModelToJson(OtpDataModel instance) =>
    <String, dynamic>{'expires_in': instance.expiresIn, 'code': instance.code};

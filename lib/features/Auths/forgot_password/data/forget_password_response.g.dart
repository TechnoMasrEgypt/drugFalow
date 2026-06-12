// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetResponseModel _$ForgetResponseModelFromJson(Map<String, dynamic> json) =>
    ForgetResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: ForgotDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForgetResponseModelToJson(
  ForgetResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

ForgotDataModel _$ForgotDataModelFromJson(Map<String, dynamic> json) =>
    ForgotDataModel(code: json['code'] as String);

Map<String, dynamic> _$ForgotDataModelToJson(ForgotDataModel instance) =>
    <String, dynamic>{'code': instance.code};

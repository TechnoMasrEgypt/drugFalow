// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_reset_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResetCodeResponse _$VerifyResetCodeResponseFromJson(
  Map<String, dynamic> json,
) => VerifyResetCodeResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
);

Map<String, dynamic> _$VerifyResetCodeResponseToJson(
  VerifyResetCodeResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
};

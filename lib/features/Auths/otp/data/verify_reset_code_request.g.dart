// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_reset_code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResetCodeRequest _$VerifyResetCodeRequestFromJson(
  Map<String, dynamic> json,
) => VerifyResetCodeRequest(
  email: json['email'] as String,
  code: json['code'] as String,
);

Map<String, dynamic> _$VerifyResetCodeRequestToJson(
  VerifyResetCodeRequest instance,
) => <String, dynamic>{'email': instance.email, 'code': instance.code};

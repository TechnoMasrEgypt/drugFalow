// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordParams _$ResetPasswordParamsFromJson(Map<String, dynamic> json) =>
    ResetPasswordParams(
      email: json['email'] as String?,
      resetToken: json['reset_token'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
    );

Map<String, dynamic> _$ResetPasswordParamsToJson(
  ResetPasswordParams instance,
) => <String, dynamic>{
  'email': instance.email,
  'reset_token': instance.resetToken,
  'password': instance.password,
  'password_confirmation': instance.passwordConfirmation,
};

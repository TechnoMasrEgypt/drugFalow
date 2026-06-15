import 'package:json_annotation/json_annotation.dart';

part 'reset_password_params.g.dart';

@JsonSerializable()
class ResetPasswordParams {
  String? email;

  @JsonKey(name: 'reset_token')
  String? resetToken;

  String? password;

  @JsonKey(name: 'password_confirmation')
  String? passwordConfirmation;

  ResetPasswordParams({
    this.email,
    this.resetToken,
    this.password,
    this.passwordConfirmation,
  });

  factory ResetPasswordParams.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordParamsToJson(this);
}

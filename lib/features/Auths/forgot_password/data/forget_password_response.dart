import 'package:json_annotation/json_annotation.dart';

part 'forget_password_response.g.dart';

// ── Top-level: {"success": true, "message": "...", "data": {...}} ─────────────

@JsonSerializable()
class ForgetResponseModel {
  final bool   success;
  final String message;
  final ForgotDataModel data;

  const ForgetResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ForgetResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetResponseModelToJson(this);
}

// ── Data: {"expires_in": "2 minutes", "code": "159805"} ──────────────────────

@JsonSerializable()
class ForgotDataModel {
 

  final String code;

  const ForgotDataModel({ required this.code});

  factory ForgotDataModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotDataModelToJson(this);
}

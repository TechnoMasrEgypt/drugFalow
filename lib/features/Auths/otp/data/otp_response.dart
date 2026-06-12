import 'package:json_annotation/json_annotation.dart';

part 'otp_response.g.dart';

// ── Top-level: {"success": true, "message": "...", "data": {...}} ─────────────

@JsonSerializable()
class OtpResponseModel {
  final bool   success;
  final String message;
  final OtpDataModel data;

  const OtpResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OtpResponseModelToJson(this);
}

// ── Data: {"expires_in": "2 minutes", "code": "159805"} ──────────────────────

@JsonSerializable()
class OtpDataModel {
  @JsonKey(name: 'expires_in')
  final String expiresIn;

  final String code;

  const OtpDataModel({required this.expiresIn, required this.code});

  factory OtpDataModel.fromJson(Map<String, dynamic> json) =>
      _$OtpDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$OtpDataModelToJson(this);
}

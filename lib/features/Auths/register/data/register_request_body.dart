import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String name;
  final String email;
  final String password;

  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;

  final String phone;

  @JsonKey(name: 'second_phone')
  final String? secondPhone;

  final String? landline;

  @JsonKey(name: 'governorate_id')
  final int governorateId;

  @JsonKey(name: 'city_id')
  final int cityId;

  @JsonKey(name: 'area_id')
  final int areaId;

  final String address;

  @JsonKey(includeToJson: false, includeFromJson: false)
  final bool termsAccepted;

  // ── Excluded from json serialization ──────────────────────────────────────
  @JsonKey(includeToJson: false, includeFromJson: false)
  final String countryCode;

  @JsonKey(includeToJson: false, includeFromJson: false)
  final String? countryCode2;

  @JsonKey(includeToJson: false, includeFromJson: false)
  final String? countryCode3;

  @JsonKey(includeToJson: false, includeFromJson: false)
  final File? image;

  @JsonKey(includeToJson: false, includeFromJson: false)
  final File? licenseFile;

  RegisterRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.phone,
    this.secondPhone,
    this.landline,
    required this.governorateId,
    required this.cityId,
    required this.areaId,
    required this.address,
    this.termsAccepted = false,
    this.countryCode = '+20', // ← default, not required
    this.countryCode2,
    this.countryCode3,
    this.image,
    this.licenseFile,
  });

  factory RegisterRequestBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}

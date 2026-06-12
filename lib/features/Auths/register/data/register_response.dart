import 'package:json_annotation/json_annotation.dart';
import 'package:drug_flow/features/Auths/otp/data/otp_response.dart';

part 'register_response.g.dart';

// ── Top-level response ────────────────────────────────────────────────────────
// {"success": true, "message": "...", "data": {"expires_in": "2 minutes", "code": "..."}}

@JsonSerializable()
class AuthResponseModel {
  final bool   success;
  final String message;

  // Register now returns {expires_in, code} — same shape as the OTP response.
  final OtpDataModel data;

  const AuthResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}

// ── Data wrapper ──────────────────────────────────────────────────────────────

@JsonSerializable()
class AuthDataModel {
  final UserModel user;

  const AuthDataModel({required this.user});

  factory AuthDataModel.fromJson(Map<String, dynamic> json) =>
      _$AuthDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataModelToJson(this);
}

// ── User ──────────────────────────────────────────────────────────────────────

@JsonSerializable()
class UserModel {
  final int         id;

  // API returns {"en": "..."} — kept as NameModel
  final NameModel   name;

  final String      email;
  final String      phone;

  @JsonKey(name: 'second_phone')
  final String?     secondPhone;   // nullable — API returns null when not set

  final String?     landline;      // nullable — API returns null when not set

  // ✅ FIX: API returns these as String ("1"), not int.
  // Cubit sends int; API echoes back String. Keep String here.
  @JsonKey(name: 'governorate_id')
  final String      governorateId;

  @JsonKey(name: 'city_id')
  final String      cityId;

  @JsonKey(name: 'area_id')
  final String      areaId;

  // API returns {"en": "..."} — kept as AddressModel
  final AddressModel address;

  // ✅ FIX: was File? on request side; response returns a URL String.
  // These are two different stages — no conflict when typed correctly.
  @JsonKey(name: 'license_file')
  final String      licenseFile;
  final String image;

  @JsonKey(name: 'is_verified')
  final bool        isVerified;

  @JsonKey(name: 'is_active')
  final bool        isActive;

  @JsonKey(name: 'pharmacy_code')
  final String      pharmacyCode;

  @JsonKey(name: 'created_at')
  final String      createdAt;

  @JsonKey(name: 'updated_at')
  final String      updatedAt;

  const UserModel({
    required this.id,
      required this.image,
    required this.name,
    required this.email,
    required this.phone,
    this.secondPhone,
    this.landline,
    required this.governorateId,
    required this.cityId,
    required this.areaId,
    required this.address,
    required this.licenseFile,
    required this.isVerified,
    required this.isActive,
    required this.pharmacyCode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

// ── Localised string wrapper ──────────────────────────────────────────────────
// {"en": "..."}

@JsonSerializable()
class NameModel {
  final String en;

  const NameModel({required this.en});

  factory NameModel.fromJson(Map<String, dynamic> json) =>
      _$NameModelFromJson(json);

  Map<String, dynamic> toJson() => _$NameModelToJson(this);
}

@JsonSerializable()
class AddressModel {
  final String en;

  const AddressModel({required this.en});

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}

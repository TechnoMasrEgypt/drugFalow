import 'package:json_annotation/json_annotation.dart';
part 'profile_response.g.dart';
@JsonSerializable()
class ProfileResponse {
  final bool? success;
  final String? message;
  final ProfileData? data;

  ProfileResponse({this.success, this.message, this.data});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
@JsonSerializable()
class ProfileData {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? secondPhone;
  final String? landline;
  final String? image;
  final String? pharmacyCode;
  final int? governorateId;
  final String? governorate;
  final int? cityId;
  final String? city;
  final int? areaId;
  final String? area;
  final String? address;
  final String? licenseFile;

  ProfileData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.secondPhone,
    this.landline,
    this.image,
    this.pharmacyCode,
    this.governorateId,
    this.governorate,
    this.cityId,
    this.city,
    this.areaId,
    this.area,
    this.address,
    this.licenseFile,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}
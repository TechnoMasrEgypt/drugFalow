import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'update_profile_request_body.g.dart';

@JsonSerializable()
class UpdateProfileRequestBody {
  final String? name;
  final String? email;
  final String? phone;

  @JsonKey(name: 'second_phone')
  final String? secondPhone;

  final String? landline;
  final String? address;

  @JsonKey(name: 'governorate_id')
  final String? governorateId;

  @JsonKey(name: 'city_id')
  final String? cityId;

  @JsonKey(name: 'area_id')
  final String? areaId;

  @JsonKey(includeToJson: false, includeFromJson: false)
  final File? image;

  @JsonKey(includeToJson: false, includeFromJson: false)
  final File? license;

  UpdateProfileRequestBody({
    this.name,
    this.email,
    this.phone,
    this.secondPhone,
    this.landline,
    this.address,
    this.governorateId,
    this.cityId,
    this.areaId,
    this.image,
    this.license,
  });

  factory UpdateProfileRequestBody.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileRequestBodyToJson(this);
}

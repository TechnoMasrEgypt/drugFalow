import 'package:json_annotation/json_annotation.dart';

part 'governorate_model.g.dart';

// ── Top-level response ────────────────────────────────────────────────────────

@JsonSerializable()
class GovernoratesResponse {
  final bool success;
  final String message;
  final List<GovernorateModel> data;

  const GovernoratesResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GovernoratesResponse.fromJson(Map<String, dynamic> json) =>
      _$GovernoratesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GovernoratesResponseToJson(this);
}

// ── Governorate ───────────────────────────────────────────────────────────────

@JsonSerializable()
class GovernorateModel {
  final int id;
  final String name;
  final List<CityModel> cities;

  const GovernorateModel({
    required this.id,
    required this.name,
    required this.cities,
  });

  factory GovernorateModel.fromJson(Map<String, dynamic> json) =>
      _$GovernorateModelFromJson(json);

  Map<String, dynamic> toJson() => _$GovernorateModelToJson(this);
}

// ── City ──────────────────────────────────────────────────────────────────────

@JsonSerializable()
class CityModel {
  final int id;
  final String name;
  final List<AreaModel> areas;

  const CityModel({
    required this.id,
    required this.name,
    required this.areas,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}

// ── Area ──────────────────────────────────────────────────────────────────────

@JsonSerializable()
class AreaModel {
  final int id;
  final String name;

  const AreaModel({
    required this.id,
    required this.name,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) =>
      _$AreaModelFromJson(json);

  Map<String, dynamic> toJson() => _$AreaModelToJson(this);
}

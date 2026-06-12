// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'governorate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GovernoratesResponse _$GovernoratesResponseFromJson(
  Map<String, dynamic> json,
) => GovernoratesResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => GovernorateModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GovernoratesResponseToJson(
  GovernoratesResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

GovernorateModel _$GovernorateModelFromJson(Map<String, dynamic> json) =>
    GovernorateModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      cities: (json['cities'] as List<dynamic>)
          .map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GovernorateModelToJson(GovernorateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cities': instance.cities,
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  areas: (json['areas'] as List<dynamic>)
      .map((e) => AreaModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'areas': instance.areas,
};

AreaModel _$AreaModelFromJson(Map<String, dynamic> json) =>
    AreaModel(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$AreaModelToJson(AreaModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

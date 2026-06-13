// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactResponse _$ContactResponseFromJson(Map<String, dynamic> json) =>
    ContactResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: ContactData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactResponseToJson(ContactResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

ContactData _$ContactDataFromJson(Map<String, dynamic> json) => ContactData(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  message: json['message'] as String,
  created_at: json['created_at'] as String,
  read_at: json['read_at'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$ContactDataToJson(ContactData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'message': instance.message,
      'created_at': instance.created_at,
      'read_at': instance.read_at,
      'status': instance.status,
    };

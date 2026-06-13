import 'package:json_annotation/json_annotation.dart';

part 'contact_response.g.dart';

@JsonSerializable()
class ContactResponse {
  final bool success;
  final String message;
  final ContactData data;

  ContactResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseFromJson(json);
}

@JsonSerializable()
class ContactData {
  final int id;
  final String name;
  final String email;
  final String message;
  final String created_at;
  final String? read_at;
  final String? status;

  ContactData({
    required this.id,
    required this.name,
    required this.email,
    required this.message,
    required this.created_at,
    this.read_at,
    this.status,
  });

  factory ContactData.fromJson(Map<String, dynamic> json) =>
      _$ContactDataFromJson(json);
}
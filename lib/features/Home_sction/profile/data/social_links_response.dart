import 'package:json_annotation/json_annotation.dart';

part 'social_links_response.g.dart';

@JsonSerializable()
class SocialLinksResponse {
  final bool success;
  final String message;
  final SocialLinksData data;

  SocialLinksResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SocialLinksResponse.fromJson(Map<String, dynamic> json) =>
      _$SocialLinksResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SocialLinksResponseToJson(this);
}

@JsonSerializable()
class SocialLinksData {
  final String? facebook;
  final String? instagram;
  final String? twitter;
  final String? linkedin;
  final String? youtube;
  final String? whatsapp;

  @JsonKey(name: 'header_logo')
  final String? headerLogo;

  SocialLinksData({
    this.facebook,
    this.instagram,
    this.twitter,
    this.linkedin,
    this.youtube,
    this.whatsapp,
    this.headerLogo,
  });

  factory SocialLinksData.fromJson(Map<String, dynamic> json) =>
      _$SocialLinksDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SocialLinksDataToJson(this);
}
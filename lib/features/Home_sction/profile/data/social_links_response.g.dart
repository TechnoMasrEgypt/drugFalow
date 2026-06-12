// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_links_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialLinksResponse _$SocialLinksResponseFromJson(Map<String, dynamic> json) =>
    SocialLinksResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: SocialLinksData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SocialLinksResponseToJson(
  SocialLinksResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

SocialLinksData _$SocialLinksDataFromJson(Map<String, dynamic> json) =>
    SocialLinksData(
      facebook: json['facebook'] as String?,
      instagram: json['instagram'] as String?,
      twitter: json['twitter'] as String?,
      linkedin: json['linkedin'] as String?,
      youtube: json['youtube'] as String?,
      whatsapp: json['whatsapp'] as String?,
      headerLogo: json['header_logo'] as String?,
    );

Map<String, dynamic> _$SocialLinksDataToJson(SocialLinksData instance) =>
    <String, dynamic>{
      'facebook': instance.facebook,
      'instagram': instance.instagram,
      'twitter': instance.twitter,
      'linkedin': instance.linkedin,
      'youtube': instance.youtube,
      'whatsapp': instance.whatsapp,
      'header_logo': instance.headerLogo,
    };

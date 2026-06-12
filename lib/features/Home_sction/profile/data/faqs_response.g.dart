// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqsResponse _$FaqsResponseFromJson(Map<String, dynamic> json) => FaqsResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => FaqModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FaqsResponseToJson(FaqsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

FaqModel _$FaqModelFromJson(Map<String, dynamic> json) => FaqModel(
  id: (json['id'] as num).toInt(),
  question: json['question'] as String,
  answer: json['answer'] as String,
);

Map<String, dynamic> _$FaqModelToJson(FaqModel instance) => <String, dynamic>{
  'id': instance.id,
  'question': instance.question,
  'answer': instance.answer,
};

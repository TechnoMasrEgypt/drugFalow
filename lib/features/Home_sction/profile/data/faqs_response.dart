import 'package:json_annotation/json_annotation.dart';

part 'faqs_response.g.dart';

@JsonSerializable()
class FaqsResponse {
  final bool success;
  final String message;
  final List<FaqModel> data;

  FaqsResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory FaqsResponse.fromJson(Map<String, dynamic> json) =>
      _$FaqsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FaqsResponseToJson(this);
}

@JsonSerializable()
class FaqModel {
  final int id;
  final String question;
  final String answer;

  FaqModel({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaqModelToJson(this);
}
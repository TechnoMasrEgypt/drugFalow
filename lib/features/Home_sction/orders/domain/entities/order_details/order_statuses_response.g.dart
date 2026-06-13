// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_statuses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatusesResponse _$OrderStatusesResponseFromJson(
  Map<String, dynamic> json,
) => OrderStatusesResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => OrderStatusModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OrderStatusesResponseToJson(
  OrderStatusesResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data.map((e) => e.toJson()).toList(),
};

OrderStatusModel _$OrderStatusModelFromJson(Map<String, dynamic> json) =>
    OrderStatusModel(
      value: json['value'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$OrderStatusModelToJson(OrderStatusModel instance) =>
    <String, dynamic>{'value': instance.value, 'label': instance.label};

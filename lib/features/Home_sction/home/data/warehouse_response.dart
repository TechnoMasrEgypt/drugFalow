import 'package:json_annotation/json_annotation.dart';

part 'warehouse_response.g.dart';

@JsonSerializable()
class WarehouseResponse {
  final bool? success;
  final String? message;
  final WarehouseData? data;

  WarehouseResponse({
    this.success,
    this.message,
    this.data,
  });

  factory WarehouseResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$WarehouseResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WarehouseResponseToJson(this);
}

@JsonSerializable()
class WarehouseData {
  final List<WarehouseItem>? items;
  final Meta? meta;

  WarehouseData({
    this.items,
    this.meta,
  });

  factory WarehouseData.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$WarehouseDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WarehouseDataToJson(this);
}

@JsonSerializable()
class WarehouseItem {
  final int? id;
  final String? name;
  final String? logo;

  WarehouseItem({
    this.id,
    this.name,
    this.logo,
  });

  factory WarehouseItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$WarehouseItemFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WarehouseItemToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: 'current_page')
  final int? currentPage;

  @JsonKey(name: 'last_page')
  final int? lastPage;

  @JsonKey(name: 'per_page')
  final int? perPage;

  final int? total;

  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;

  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;

  Meta({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory Meta.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MetaFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MetaToJson(this);
}